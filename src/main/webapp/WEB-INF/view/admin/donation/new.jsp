<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<title>New Donation</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/static/admin1/assets/css/styles.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/static/user/assets/css/custom-bs.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/static/user/assets/css/style.css"
	rel="stylesheet">

<script
	src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/scripts.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/datatables-simple-demo.js"></script>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/JQuery3.3.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>


<!--Nút bấm mở table nhỏ-->
<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/bootstrap.bundle.min.js"></script>
<!--Nút bấm mở table nhỏ-->
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
			<div id="layoutSidenav_nav menu">
				<nav class="sb-sidenav accordion sb-sidenav-dark"
					id="sidenavAccordion">
					<div class="sb-sidenav-menu" style="background-color: #89ba16">
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
					<form:form action="${pageContext.request.contextPath}/admin/addNewDonation" method="post" modelAttribute="newDonation"> 
						<div class="container-fluid px-4">
							<div class="card mb-4">
								<div class="card-header">
									<h5 class="mt-4">Thêm mới đợt quyên góp.</h5>
								</div>
								<div class="card-body my-2">
								
								<c:if test="${not empty param.error}">
								<div class="alert alert-warning text-center">${error}</div>	
								</c:if>
									<div class="row">
										<div class="col-6">
										
											<label for="code" class="col-fo rm-label">Mã đợt quyên góp:</label> 
										
												<form:input id="code" type="text" class="form-control"
												name="code" path="code" />
												<div class="mt-3"><form:errors path="code" class="alert alert-warning ml-3 mx-3" style="width: 93%;"/>
												</div>
												
												
												
											
										</div>
										<div class="col-6 my-1">
											<label for="name" class="col-fo rm-label">Tên đợt quyên góp:</label>
												
											<form:input path="name" id="name" type="text" class="form-control" name="name"  />
											<div class="mt-3"><form:errors path="name" class="alert alert-warning ml-3" style="width: 93%;"/></div>
											
											
											
										</div>
									</div>

							
									<div class="row">
										<div class="col-6 my-1">
											<label class="col-form-label">Ngày bắt đầu:</label> 
											<form:input path="startDate" type="date" class="form-control"/>
											<div class="mt-3"><form:errors path="startDate" class="alert alert-warning ml-3" style="width: 93%;"/></div>
											
												  
											
										</div>
										<div class="col-6 my-1">
											<label class="col-form-label">Ngày kết thúc:</label> 
											<form:input path="endDate" type="date" class="form-control"  />
											<div class="mt-3"><form:errors path="endDate" class="alert alert-warning ml-3" style="width: 93%;"/>	</div>
											
											
										</div>
									</div>

									<!--Tổng số tiền trạng thái-->
									<div class="row">
										 <div class="col-6 my-1">
											<label class="col-form-label">Tổng tiền quyên góp:</label> 
											<input class="form-control" readonly="readonly" placeholder="0 VND"></input>
										</div> 
										<div class="col-6 my-1">
											<label for="status" class="col-form-label">Trạng thái:</label>
												<form:select id="status" path="status" class="form-control">
													<form:option value="-1">----</form:option>
													<form:option value="0">Mới tạo</form:option>
													<form:option value="1">Đang quyên góp</form:option>
													<form:option value="2">Kết thúc quyên góp</form:option>
													<form:option value="3">Đóng quyên góp</form:option>
											</form:select>
											<div class="mt-3"><form:errors path="status" class="alert alert-warning ml-3" style="width: 93%;"/></div>
											
										</div>
									</div>

									<!--Tổ chức & số đt-->
									<div class="row">
										<div class="col-6 my-1">
											<label for="organizationName" class="col-fo rm-label">Tổ chức:</label>
											<form:input path="organizationName" id="organizationName" type="text" class="form-control" />
											<div class="mt-3"><form:errors path="organizationName" class="alert alert-warning ml-3" style="width: 93%;"/>	</div>
											
										</div>
										<div class="col-6 my-1">
											<label for="phoneNumber" class="col-form-label">Số điện thoại:</label>
												<form:input path="phoneNumber" id="phoneNumber" type="number" class="form-control" />
												<div class="mt-3"><form:errors path="phoneNumber" class="alert alert-warning ml-3" style="width: 93%;"/></div>
												
										</div>
									</div>

									<!--Địa điểm & nội dung-->
									<div class="row">
										<div class="col-12">
											<label for="loacl" class="col-form-label">Địa điểm:</label> 
											<form:input path="local" id="local" type="text" class="form-control"/>
											<div class="mt-3"><form:errors  path="local" class="alert alert-warning ml-3" style="width: 93%;"/></div>
											
										</div>
										<div class="col-12">
											<label class="col-form-label">Nội dung:</label>
											<form:textarea path="description" class="form-control custom-input" rows="3" />
											<div class="mt-3"><form:errors path="description" class="alert alert-warning ml-3" style="width: 93%;" />
											</div>
											
										</div>
									</div>
									<div class="d-flex justify-content-between">
										<a href="${pageContext.request.contextPath}/admin/donations" type="button"
											style="width: 80px" class="btn btn-secondary m-2"> Back</a> 
										<input class="btn btn-secondary m-2" style="width: 80px; background-color: dodgerblue;" type="submit" value="Lưu" />
									</div>
								</div>
							</div>
						</div>
					</form:form>
				</main>
			</div>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4"></div>
			</footer>
		</div>
	</div>
</body>

</html>