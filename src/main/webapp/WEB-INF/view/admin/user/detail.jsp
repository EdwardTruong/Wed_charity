<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="Form tạo mới User bằng thymeleaf" />
<meta name="author" content="truongFunix20125" />
<title>Detail User</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<!--Tạo evenClick vào 3 cái nút ẩn hiện nav-->
<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/scripts.js"></script>
<!--Cái nút 3 gạch ẩn hiện-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<!--Cái khung nav-->
<link href="${pageContext.request.contextPath}/resources/static/admin1/assets/css/styles.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/static/user/assets/css/custom-bs.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/static/user/assets/css/style.css" rel="stylesheet">
<!--End New-->
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<nav id="menu"
			class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<!-- Navbar Brand-->
			<a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/admin/home">QUẢN TRỊ</a>
			<!-- Sidebar Toggle-->
			<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
				id="sidebarToggle" href="#!">
				<i class="fas fa-bars"></i>
			</button>
			<!-- Navbar Search-->
			<form
				class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

			</form>
			<!-- Navbar-->
			<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
				<li class="nav-item dropdown"><c:if
						test="${sessionScope.admin != null}">
						<a href="${pageContext.request.contextPath}/logout"
							class="nav-link dropdown-toggle" role="button"><i
							class="fas fa-user fa-fw"></i><span>Logout</span></a>
					</c:if>

					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown1">
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Activity Log</a></li>
						<li>
							<hr class="dropdown-divider" />
						</li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath}/logout">Logout</a></li>
					</ul>
					<c:if test="${sessionScope.admin == null}">
						<div class="sb-sidenav-menu">
							<div class="nav">
								<a class="nav-link"
									href="${pageContext.request.contextPath}/home"> <i
									class="sb-nav-link-icon"> <i class="fas fa-tachometer-alt"></i>
								</i> HOME
								</a>
							</div>
						</div>
					</c:if>
					</li>
			</ul>
		</nav>
	</nav>

	<div id="layoutSidenav">
		<!--Cái Nav-->
		<div id="layoutSidenav_nav">
			<div id="html_menu" id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-dark"
					id="sidenavAccordion">
					<c:if test="${sessionScope.admin != null}">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<a class="nav-link" href="${pageContext.request.contextPath}/admin/users"> <i
								class="sb-nav-link-icon"> <i class="fas fa-tachometer-alt"></i>
							</i> Quản lý người dùng
							</a> <a class="nav-link" href="${pageContext.request.contextPath}/admin/donations"> <i
								class="sb-nav-link-icon"> <i class="fas fa-tachometer-alt"></i>
							</i> Quản lý đợt quyên góp
							</a>
						</div>
					</div>
					</c:if>

					<c:if test="${sessionScope.admin == null}">
						<div class="sb-sidenav-menu">
							<div class="nav">
								<a class="nav-link" href="${pageContext.request.contextPath}/home"> <i
									class="sb-nav-link-icon"> <i class="fas fa-tachometer-alt"></i>
								</i> HOME
								</a>
							</div>
						</div>
					</c:if>
				</nav>
			</div>
		</div>
		<!-- main -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="card mb-4">
						<div class="card-header ">
							<h3 class="mt-4">${pageTitle}</h3>
							<br>
						</div>
						<div class="card-body d-flex justify-content-around ">
							<div class="container-fluid px-4">
							
								<c:if test="${sessionScope.success != null}">
									<p class="alert alert-success text-center">${sessionScope.success}</p>
								    <c:remove var="success" scope="session"/>
								</c:if>
							
								
								
								<div class="card-body">
									<div class="form-group row mb-4 mb-4">
										<label class="col-sm-4 col-form-label">Tên:</label>
										<div class="col-sm-8">
											<span class="form-control">${user.fullName}</span>
										</div>
									</div>
									<div class="form-group row mb-4">
										<label class="col-sm-4 col-form-label">E-mail:</label>
										<div class="col-sm-8">
											<span class="form-control">${user.email}</span>
										</div>
									</div>

									<div class="form-group row mb-4">
										<label class="col-sm-4 col-form-label">Số điện Thoại:</label>
										<div class="col-sm-8">
											<span class="form-control">${user.phoneNumber}</span>
										</div>
									</div>

									<div class="form-group row mb-4">
										<label class="col-sm-4 col-form-label">Địa chỉ:</label>
										<div class="col-sm-8">
											<span class="form-control">${user.address}</span>
										</div>
									</div>

									<div class="form-group row mb-4">
										<label class="col-sm-4 col-form-label">Ngày tạo:</label>
										<div class="col-sm-8">
											<span class="form-control">${user_created}</span>
										</div>
									</div>

									<div class="form-group row mb-4">
										<label class="col-sm-4 col-form-label">User-Name:</label>
										<div class="col-sm-8">
											<span class="form-control">${user.userName}</span>
										</div>
									</div>

									<div class="form-group row mb-4">
										<label class="col-sm-4 col-form-label">Mật Khẩu:</label>
										<div class="col-sm-8">
											<span class="form-control">${user.password}</span>

										</div>
									</div>

									<div class="form-group row mb-4">
										<label class="col-sm-4 col-form-label">Ghi Chú:</label>
										<div class="col-sm-8">
											<span class="form-control">${user.note}</span>
										</div>
									</div>
									<div class="form-group row mb-4">
										<label class="col-sm-4 col-form-label">Trạng thái hoạt
											động:</label>
										<div class="col-sm-8">
											<c:choose>
												<c:when test="${user.status == 1}">
													<span class="form-control" readonly="readonly">HOẠT
														ĐÔNG</span>
												</c:when>
												<c:when test="${user.status == 0}">
													<span class="form-control" readonly="readonly">BỊ
														KHÓA</span>
												</c:when>
											</c:choose>

										</div>
									</div>
								</div>
							</div>
						</div>


						<!--3 cái nút cuối trang-->
						<c:if test="${sessionScope.admin != null}">
							<div class="d-flex justify-content-between">
								<a href="${pageContext.request.contextPath}/admin/users"><button
										type="button" style="width: 80px"
										class="btn btn-secondary m-2 ">Back</button></a> <a
									href="${pageContext.request.contextPath}/admin/editUser/${user.id}"><button
										type="button" style="width: 80px;" class="btn btn-primary m-2">
										Sửa</button></a>
							</div>
						</c:if><!-- admin -->
						

						<c:if test="${sessionScope.user != null}">
							<div class="d-flex justify-content-between">
								<a href="${pageContext.request.contextPath}/home"><button
										type="button" style="width: 80px"
										class="btn btn-secondary m-2 ">Back</button></a> <a
									href="${pageContext.request.contextPath}/user/edit/${user.id}"><button
										type="button" style="width: 80px;" class="btn btn-primary m-2">
										Sửa</button></a>
							</div>
						</c:if>	<!-- sessionScope.user != null -->
					
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
</html>