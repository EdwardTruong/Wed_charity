<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="Form tạo mới User bằng thymeleaf" />
<meta name="author" content="truongFunix20125" />
<title>Thêm mới</title>
<link href="${pageContext.request.contextPath}/resources/static/admin1/assets/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/custom-bs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/user/assets/css/style.css">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/datatables-simple-demo.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/scripts.js"></script>
<!--Nút bấm mở table nhỏ-->
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/bootstrap.bundle.min.js"></script>
<!--Nút bấm mở table nhỏ-->
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/stickyfill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.fancybox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/owl.carousel.min.js}"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/newJs.js"></script>
<script src="js/datatables-simple-demo.js"></script>
<script src="js/JQuery3.3.1.js"></script>
<script src="js/scripts.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!--End NEW -->
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<nav id="menu" 
			class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<!-- Navbar Brand-->
			<a class="navbar-brand ps-3"
				href="${pageContext.request.contextPath}/admin/home">QUẢN TRỊ</a>
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
					</ul></li>
			</ul>
		</nav>
	</nav>

	<div id="layoutSidenav">
		<!--Cái Nav-->
		<div id="layoutSidenav_nav">
			<div id="menu" id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-dark"
					id="sidenavAccordion">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<a class="nav-link"
								href="${pageContext.request.contextPath}/admin/users"> <i
								class="sb-nav-link-icon"> <i class="fas fa-tachometer-alt"></i>
							</i> Quản lý người dùng
							</a> <a class="nav-link"
								href="${pageContext.request.contextPath}/admin/donations"> <i
								class="sb-nav-link-icon"> <i class="fas fa-tachometer-alt"></i>
							</i> Quản lý đợt quyên góp
							</a>
						</div>
					</div>
				</nav>
			</div>
		</div>

		<div id="layoutSidenav_content">
			<div>
				<main>
				<!--Danh sách người dùng-->
				<div class="card mb-4">
					<div class="card-header">
						<h1 class="my-3">Thêm người dùng mới</h1>
					</div>
					<div class="card-body" style="width: auto;">
						<c:if test="${not empty error}">
							<div class="alert alert-warning text-center">${error}</div>
						</c:if>
						<div class="modal-content mx-2 mt-4">
							
							
							<form:form action="${pageContext.request.contextPath}/admin/processAddNewUser"
								modelAttribute="newUser" method="post" class="mx-5">
								<form:input type="hidden" value="1" path="status" />
								
								<div class="row mt-2">
									<div class="col-6">
										<label class="col-form-label ml-2">Họ và Tên:</label>
										<div>
											<form:input type="text" path="fullName"
												class="form-control ml-2" style="width: 95%;"
												placeholder="Full name" />
											<div class="mt-3">
												<form:errors path="fullName" class="alert alert-warning ml-3"
												style="width: 93%;" />
											</div>
										</div>
									</div>
									<div class="col-6">
										<label class="col-form-label ml-2">Email:</label>
										<div>
											<form:input type="email" path="email" class="form-control"
												style="width: 95%;" placeholder="example@gmail.com" />
											<div class="mt-3">
											<form:errors path="email" class="alert alert-warning ml-3"
												style="width: 93%;" /></div>
										</div>
									</div>
								</div>
								
								
								<div class="row">
									<div class="col-6">
										<label class="col-form-label ml-2">Địa chỉ:</label>
										<div>
											<form:input type="text" path="address" style="width: 95%;" 
												class="form-control ml-2" id="address" placeholder="Địa chỉ" />
											<div class="mt-3">
											<form:errors path="address" class="alert alert-warning ml-3"
												style="width: 93%;" /></div>
										</div>
									</div>
									<div class="col-6">
										<label class="col-form-label ml-2">Số điện thoại:</label>
										<div>
											<form:input type="number" style="width: 95%;" class="form-control"
												 path="phoneNumber"
												id="phoneNumber" placeholder="--- --- ----" />
											<div class="mt-3">
											<form:errors path="phoneNumber"
												class="alert alert-warning ml-3" style="width: 93%;" /></div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-6">
										<label for="fullName" class="col-form-label ml-2">Tên
											tài khoản:</label>
										<div>
											<form:input type="text" path="userName" id="fullName"
												 class="form-control ml-2" style="width: 95%;"
												placeholder="Từ 6 đến 20 ký tự" />
											<div class="mt-3">
											<form:errors path="userName" class="alert alert-warning ml-3"
												style="width: 93%;" /></div>
										</div>
									</div>
									<div class="col-6">
										<label for="password" class="col-form-label ml-2">Mật
											khẩu:</label>
										<div>
											<form:input type="password" path="password" class="form-control" style="width: 95%;"
												 placeholder="xxxxxx" />
												<div class="mt-3">
											<form:errors path="password" class="alert alert-warning ml-2"
												style="width: 93%;" />
												</div>
										</div>
									</div>
									<div class="col-6">
										<label for="role" class="col-form-label ml-2">Vai trò:</label>
										<div>
											<form:select id="role" path="roleId" style="width: 95%;"
												class="form-control ml-2">
												<option value="  ">--Vai Trò--</option>
												<form:option value="1">Admin</form:option>
												<form:option value="2">User</form:option>
											</form:select>
											
										<div class="mt-3">
											<form:errors path="roleId" class="alert alert-warning ml-3 mt-3"
												style="width: 93%;"/>
											</div>
										</div>
									</div>
								</div>
								
								<div class="modal-footer d-flex justify-content-between my-3">
									<a href="${pageContext.request.contextPath}/admin/users"><button
											type="button" data-bs-dismiss="modal"
											class="btn btn-secondary">Back</button></a> <input type="submit"
										class="btn btn-primary" value="Thêm"></input>
								</div>
							</form:form>
						
						</div>
					</div>
				</div>
					


				</main>
			</div>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4"></div>
			</footer>
		</div>
	</div>
</body>



	

	
		
		
			
				
			
			
		
	


</html>