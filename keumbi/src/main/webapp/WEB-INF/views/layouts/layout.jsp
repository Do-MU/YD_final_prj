<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png" type="image/png">
<title>MeetMe Personal</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/linericon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/lightbox/simpleLightbox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/nice-select/css/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/animate-css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/popup/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/flaticon/flaticon.css">
<!-- main css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="body"/>
	<footer>
		<tiles:insertAttribute name="footer"/>
	</footer>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/popper.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/stellar.js"></script>
        <script src="${pageContext.request.contextPath}/resources/vendors/lightbox/simpleLightbox.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/vendors/nice-select/js/jquery.nice-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/vendors/isotope/imagesloaded.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/vendors/isotope/isotope.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/vendors/popup/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.ajaxchimp.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/vendors/counter-up/jquery.waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/vendors/counter-up/jquery.counterup.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/mail-script.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/theme.js"></script>
</body>
</html>