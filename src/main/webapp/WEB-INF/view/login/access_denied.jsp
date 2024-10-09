<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>   

<!DOCTYPE html>
<html lang="vn">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>ACCESS DENIED</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/static/admin1/assets/css/styles.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/static/user/assets/css/custom-bs.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/static/user/assets/css/style.css" rel="stylesheet">


<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/scripts.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/datatables-simple-demo.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>


<script src="js/JQuery3.3.1.js"></script>

<script src="js/scripts.js"></script>

<script src="js/datatables-simple-demo.js"></script>
</head>

<body class="sb-nav-fixed">
	<!-- th:fragment="html_nav" -->
	<nav id="menu" class="mx-auto site-navigation">
		<ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
			<li  class="d-lg-none">
				<c:if test="${sessionScope.user != null}">
				    <a href="post-job.html">
				        <span class="mr-2">${sessionScope.user.fullName}</span>
				    </a>
				</c:if>
			</li>
			<li class="d-lg-none">
				<c:if test="${sessionScope.user != null}">
				   <a href="${pageContext.request.contextPath}/user/logout">Đăng xuất</a>
				</c:if>
			</li>
			<li class="d-lg-none">
				<c:if test="${sessionScope.user == null}">
				    <a href="${pageContext.request.contextPath}/user/login">Đăng nhập</a>
				</c:if>
			</li>
		</ul>
	</nav>

		<main>
		<div id="layoutSidenav_content">
			<h1 style="color: red;">ACCESS DENIED</h1>
			<div class="ml-3 mb-3">
				<a href="${pageContext.request.contextPath}/home"><button class="btn btn-success">HOME
						PAGE</button></a>
			</div>
		</div>
	</main>
</body>
</html>