<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/sale"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<!-- https://materializecss.com/color.html script 및 css 참고 홈페이지 -->

<!-- Compiled and minified CSS, https://cdnjs.cloudflare.com/ -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript, https://cdnjs.cloudflare.com/ -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<title>Join us</title>

<link rel="stylesheet" href="${appRoot }/resources/css/join.css">

<script>

</script>

</head>

<body>

<!-- 
 

  <select id="read" resultMap="memberMap">
  SELECT 
	m.memberId memberId,
	m.memberpw memberpw,
	m.memberName memberName,
	m.memberBirth memberBirth,
	m.memberPhoneNum memberPhoneNum,
	m.memberMail memberMail,
	m.memberAddNum memberAddNum,
	m.memberAddCity memberAddCity,
	m.enabled enabled,
	m.money money,
	a.auth auth
  FROM 
    tp_member m LEFT JOIN tbl_member_auth a ON m.memberId = a.memberId
  WHERE
    m.memberId = #{userid}
  
  </select>
  
  
  <resultMap type="org.zerock.domain.member.TpMemberVO" id="tpMemberMap">
  	<id property="memberId" column="memberId" />
  	<result property="memberpw" column="memberpw" />
  	<result property="memberName" column="memberName" />
  	<result property="memberPhoneNum" column="memberPhoneNum" />
  	<result property="memberMail" column="memberMail" />
  	<result property="memberAddNum" column="memberAddNum" />
  	<result property="memberAddCity" column="memberAddCity" />
  	<result property="money" column="money" />
  	<collection property="authList" resultMap="authMap" />
  </resultMap>
  <resultMap type="org.zerock.domain.member.TpAuthVO" id="tpAuthMap">
  	<result property="memberId" column="memberId" />
  	<result property="auth" column="auth" />
  </resultMap>
  -->
  
</body>































