package org.zerock.product.service;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.product.domain.CategoryVO;
import org.zerock.product.domain.Criteria;
import org.zerock.product.domain.OrderVO;
import org.zerock.product.domain.ProFileVO;
import org.zerock.product.domain.ProductLikeVO;
import org.zerock.product.domain.ProductOptionVO;
import org.zerock.product.domain.ProductVO;
import org.zerock.product.mapper.ProFileMapper;
import org.zerock.product.mapper.ProductMapper;
import org.zerock.user.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.profiles.ProfileFile;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	private ProductMapper mapper;
	private UserMapper userMapper;
	private S3Client s3; // 2021.08.02
	private String bucketName; // 2021.08.02
	private String profileName; // 2021.08.02

	@Setter(onMethod_ = @Autowired)
	private ProFileMapper ProfileMapper;

	// 2021.08.02 aws s3관련
	public ProductServiceImpl() {
		this.bucketName = "choongang-lim950914";
		this.profileName = "spring1";

		/*
		 * create /home/tomcat/.aws/credentials
		 */

		Path contentLocation = new File(System.getProperty("user.home") + "/.aws/credentials").toPath();
		ProfileFile pf = ProfileFile.builder().content(contentLocation).type(ProfileFile.Type.CREDENTIALS).build();
		ProfileCredentialsProvider pcp = ProfileCredentialsProvider.builder().profileFile(pf).profileName(profileName)
				.build();

		this.s3 = S3Client.builder().credentialsProvider(pcp).build();
	}

	@Override
	public CategoryVO getCategoryMainAndSub(int category_seq) {
		return mapper.getCategoryMainAndSubs(category_seq);
	}

	@Override
	public int getCategorySeq(CategoryVO categoryVO) {
		return mapper.getCategorySeq(categoryVO);
	}

	@Override
	public List<String> getCategorySubList(String categoryMain) {
		return mapper.getCategorySubs(categoryMain);
	}

	@Override
	public List<String> getCategoryMainList() {
		return mapper.getCategoryMains();
	}

	public List<OrderVO> getOrderList(String[] order_seq) {

		List<OrderVO> list = new ArrayList<>();
		for (int i = 0; i < order_seq.length; i++) {
			OrderVO orderVO = mapper.readOrderbyOrderSeq(Integer.parseInt(order_seq[i]));
			list.add(orderVO);
		}
		return list;
	}

	public int checkProductLike(ProductLikeVO productLikeVO) {
		return mapper.checkProductLike(productLikeVO);
	}

	@Override
	@Transactional
	public int changeProductLike(ProductLikeVO productLikeVO) {
		int check = mapper.checkProductLike(productLikeVO);

		if (check > 0) {
			mapper.deleteProductLike(productLikeVO);
		} else {
			mapper.insertProductLike(productLikeVO);
		}
		int product_like = mapper.countUserSeqByProductSeq(productLikeVO.getProduct_seq());
		int result = mapper.updateProductLike(productLikeVO.getProduct_seq(), product_like);
		return product_like;
	}

	@Override
	@Transactional
	public int makeOrder(List<OrderVO> orderVOList, int user_seq, String usePoint) {
		int count = 0;
		for (OrderVO vo : orderVOList) {
			count += mapper.updateOrder(vo.getOrder_seq());
			int order_poseq = vo.getOrder_poseq();
			int order_quantity = vo.getOrder_quantity();
			mapper.updatePOquantityByOrder(order_poseq, order_quantity);

			/* ProductOptionVO의 po_quantity가 모두 0이면 그 product의 status를 1로변경(판매종료) */
			int product_seq = vo.getOrder_productseq();
			List<ProductOptionVO> list = mapper.getProductOptionList(product_seq);
			int cnt = 0;
			for (ProductOptionVO poVO : list) {
				cnt += poVO.getPo_quantity();
			}
			if (cnt == 0) {
				mapper.finishSelling(product_seq);
			}
		}

		int presentPoint = userMapper.getUserSeq(user_seq).getUser_point();
		int changedPoint = presentPoint - Integer.parseInt(usePoint);
		mapper.userPointUpdate(user_seq, changedPoint);
		return count;
	}

	@Override
	@Transactional
	public int directOrder(List<OrderVO> orderVOList, int user_seq, String usePoint) {
		int count = 0;
		for (OrderVO vo : orderVOList) {
			count += mapper.directOrder(vo);
			int order_poseq = vo.getOrder_poseq();
			int order_quantity = vo.getOrder_quantity();
			mapper.updatePOquantityByOrder(order_poseq, order_quantity);

			/* ProductOptionVO의 po_quantity가 모두 0이면 그 product의 status를 1로변경(판매종료) */
			int product_seq = vo.getOrder_productseq();
			List<ProductOptionVO> list = mapper.getProductOptionList(product_seq);
			int cnt = 0;
			for (ProductOptionVO poVO : list) {
				cnt += poVO.getPo_quantity();
			}
			if (cnt == 0) {
				mapper.finishSelling(product_seq);
			}
		}

		int presentPoint = userMapper.getUserSeq(user_seq).getUser_point();
		int changedPoint = presentPoint - Integer.parseInt(usePoint);
		mapper.userPointUpdate(user_seq, changedPoint);
		return count;
	}

	@Override
	@Transactional
	public int makeCart(List<OrderVO> list) {
		int count = 0;
		for (OrderVO vo : list) {
			count += mapper.insertCart(vo);
		}
		return count;
	}

	@Override
	public List<ProductOptionVO> getProductOption(int product_seq) {
		return mapper.getProductOptionList(product_seq);
	}

	@Override
	public void register(ProductVO product) {
		mapper.insert(product);
	}

	@Override // 2021.08.02 s3 파일 업로드
	public void register(ProductVO product, MultipartFile file) {
		register(product);

		if (file != null && file.getSize() > 0) {
			ProFileVO vo = new ProFileVO();
			vo.setSeq(product.getProduct_seq());
			vo.setFileName(file.getOriginalFilename());

			ProfileMapper.insert(vo);
			upload(product, file);
		}
	}

	// 2021.08.02 s3 파일 업로드
	private void upload(ProductVO product, MultipartFile file) {

		try (InputStream is = file.getInputStream()) {
			PutObjectRequest objectRequest = PutObjectRequest.builder().bucket(bucketName)
					.key(product.getProduct_seq() + "/" + file.getOriginalFilename()).contentType(file.getContentType())
					.acl(ObjectCannedACL.PUBLIC_READ).build();

			s3.putObject(objectRequest, RequestBody.fromInputStream(is, file.getSize()));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	@Transactional
	public void registerReturn(ProductVO product, String[] po_name, String[] po_quantity, String[] po_price) {
		mapper.insertReturnSeq(product);

		/* 상품옵션등록-서비스로 트랜잭션 */
		// List<ProductOptionVO> optionList= new ArrayList<ProductOptionVO>();
		for (int i = 0; i < po_name.length; i++) {
			ProductOptionVO poVO = new ProductOptionVO();
			poVO.setProduct_seq(product.getProduct_seq());
			poVO.setPo_name(po_name[i]);
			poVO.setPo_quantity(Integer.parseInt(po_quantity[i]));
			poVO.setPo_price(Integer.parseInt(po_price[i]));
			// optionList.add(poVO);
			mapper.insertProductOption(poVO);
		}

	}

	// 상품대표가격받아와서 수정+총재고량 업데이트하는 함수
	public void updateProductVOOnPriceQuantity(ProductVO pVO) {
		List<ProductOptionVO> poVOList = mapper.getProductOptionList(pVO.getProduct_seq());
		pVO.setProduct_price(poVOList.get(0).getPo_price());

		int total = 0;
		for (ProductOptionVO poVO : poVOList) {
			total += poVO.getPo_quantity();
		}
		pVO.setProduct_quantity(total);
	}

	@Override
	@Transactional
	public List<ProductVO> getList(Criteria cri) {
		List<ProductVO> list = mapper.getListWithPaging(cri);
		// 상품대표가격받아와서 수정+총재고량 업데이트
		for (ProductVO pVO : list) {
			updateProductVOOnPriceQuantity(pVO);
		}
		return list;
	}

	@Override
	public ProductVO get(int product_seq) {
		ProductVO pVO = mapper.read(product_seq);
		updateProductVOOnPriceQuantity(pVO);

		return pVO;
	}

	@Override
	@Transactional
	public ProductVO getCountUp(int product_seq) {
		ProductVO pVO = mapper.read(product_seq);
		mapper.readCountUp(product_seq);
		updateProductVOOnPriceQuantity(pVO);

		return pVO;
	}

	@Override
	public boolean remove(int product_seq) {
		return mapper.delete(product_seq) == 1;
	}

	@Override
	public boolean finish(int product_seq) {
		return mapper.stopSelling(product_seq) == 1;
	}

	@Override
	@Transactional
	public boolean modify(ProductVO product, String[] deletePo_seqArray, String[] productOption_seq, String[] po_name,
			String[] po_quantity, String[] po_price) {

		/* 넘어온 배열들을 기존업데이트,기존제거,신규생성으로 분류작업 */
		/* 일단 지울번호로 넘어온것을 지움 */

		int cnt = 0;
		boolean check = false;
		if (deletePo_seqArray != null) {
			for (String po_seq : deletePo_seqArray) {
				cnt += mapper.deleteProductOption(Integer.parseInt(po_seq));
			}
			if (deletePo_seqArray.length != cnt) {
				check = true;
				System.out.println("po업데이트시 제거쪽 문제발생");
			}
		}
		/* 기존업데이트와 신규생성을 분리 0으로 넘어온것은 신규 */
		for (int i = 0; i < productOption_seq.length; i++) {
			if (productOption_seq[i].equals("0")) {
				ProductOptionVO newPoVO = new ProductOptionVO();
				newPoVO.setPo_name(po_name[i]);
				newPoVO.setPo_price(Integer.parseInt(po_price[i]));
				newPoVO.setPo_quantity(Integer.parseInt(po_quantity[i]));
				newPoVO.setProduct_seq(product.getProduct_seq());
				newPoVO.setProductOption_seq(Integer.parseInt(productOption_seq[i]));
				mapper.insertProductOption(newPoVO);
			} else {
				ProductOptionVO updatePoVO = new ProductOptionVO();
				updatePoVO.setPo_name(po_name[i]);
				updatePoVO.setPo_price(Integer.parseInt(po_price[i]));
				updatePoVO.setPo_quantity(Integer.parseInt(po_quantity[i]));
				updatePoVO.setProduct_seq(product.getProduct_seq());
				updatePoVO.setProductOption_seq(Integer.parseInt(productOption_seq[i]));
				mapper.updateProductOption(updatePoVO);
			}
		}
		int corr = mapper.update(product);
		if (corr != 1) {
			check = true;
		}

		return check;
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}