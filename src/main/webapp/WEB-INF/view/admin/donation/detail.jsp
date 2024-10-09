<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detail Donation</title>
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
			<main>
				<div class="container-fluid px-4">
					<div class="card mb-4">
						<div class="card-header d-flex justify-content-around">
							<h3 class="mt-4" >${pageTitle}</h3>
						</div>
						
						<c:if test="${sessionScope.message != null}">
							 <div class="alert alert-success text-center">${sessionScope.message}</div>
						    <c:remove var="message" scope="session" />
						</c:if>
						
						
						
						<div class="card-body">
							<!--Detail-->
							<div class="row">
								<div class="col-6">
									<label class="col-fo rm-label">Mã đợt quyên góp:</label>
									<input value="${donation.code}" class="form-control" readonly="readonly"/>
										
										
								</div>
								<div class="col-6">
									<label class="col-fo rm-label">Tên đợt quyên góp:</label> 
										<input value="${donation.name}" class="form-control" readonly="readonly" />
										
								</div>
							</div>

							<div class="row">
								<div class="col-6">
									<label class="col-form-label">Ngày bắt đầu:</label> <input
										class="form-control" readonly="readonly"
										value="${startDate}"/>
								</div>
								<div class="col-6">
									<label class="col-form-label">Ngày kết thúc:</label> 
									<input class="form-control" readonly="readonly" value="${endDate}"/>
								</div>
							</div>

							<div class="row">

								<div class="col-6">
									<label class="col-form-label">Trạng thái:</label> 
									
									
									
									<c:choose>
										<c:when test="${donation.status eq '0'}">
										<input value="Khóa" class="form-control" readonly="readonly" />
										</c:when>
										<c:when test="${donation.status eq '1'}">
										<input value="Đang q.góp" class="form-control" readonly="readonly" />
										</c:when>
										<c:when test="${donation.status eq '2'}">
										<input value="Kết thúc q.góp" class="form-control" readonly="readonly" />
										</c:when>
										<c:when test="${donation.status eq '3'}">
										<input value="Đóng q.góp" class="form-control" readonly="readonly" />
										</c:when>
									</c:choose>
								</div>
								<div class="col-6">
									<label for="money" class="col-form-label">Tổng tiền
										quyên góp:</label> <input class="form-control" id="money"
										readonly="readonly" value="${donated}" />
								</div>

							</div>

							<div class="row">
								<div class="col-6">
									<label class="col-form-label">Tổ chức:</label> <input
										class="form-control" readonly="readonly"
										value="${donation.organizationName}"/>
								</div>
								<div class="col-6">
									<label class="col-form-label">Số điện thoại:</label> <input
										class="form-control" readonly="readonly"
										value="${donation.phoneNumber}"/>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<label class="col-form-label">Địa điểm:</label> <input
										class="form-control" readonly="readonly"
										value="${donation.local}"/>
								</div>

								<div class="col-12">
									<label class="col-form-label">Nội dung:</label>
									<textarea readonly="readonly"
										class="form-control" >${donation.description}"</textarea>
								</div>

							</div>
						</div>
						<!--Detail-->
						<div class="d-flex justify-content-between">
							<a href="${pageContext.request.contextPath}/admin/donations">
								<button type="submit" style="width: 150px; height: 37.5px;"
									class="btn btn-secondary m-2">Back</button>
							</a> <a href="${pageContext.request.contextPath}/admin/editDonation/${donation.id}">
								<button type="submit" style="width: 150px; height: 37.5px;"
									class="btn btn-primary m-2">Cập nhật</button>
							</a>
						</div>


						<div>
							<h3 class="mt-4">Danh sách nhà hảo tâm</h3>
							<table>
								<thead>
									<tr style="background-color: gray !important;">
										<th>Họ Tên</th>
										<th>Tiền quyên góp</th>
										<th>Nội dung</th>
										<th>Trạng thái</th>
									</tr>
								</thead>
								<tbody>
									
									
									<c:forEach var="user" items="${userDonations}">
									
										<tr>
											<td>${user.name}</td>
											<td >${user.money}</td>
											<td >${user.text}</td>
											
											<c:choose>
													<c:when test="${user.status eq '0'}">
													<td>Chờ xác nhận</td>
													</c:when>
													<c:when test="${user.status eq '1'}">
													<td>Đã xác nhận</td>
													</c:when>
													<c:when test="${user.status eq '1'}">
													<td>Không chấp nhận</td>
													</c:when>
										</c:choose>
											
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- Pagination -->
					<div class="row pagination-wrap mt-3 my-2">
						<c:if test="${isEmpty == true}">
							<div class="col-md-6 text-center text-md-left mb-4 mb-md-0">
								<p class="ml-3">Chưa có nhà hão tâm quyên góp.</p>
							</div>
						</c:if>
						
						<!-- Pagination -->
							<div class="row pagination-wrap mt-3 my-2">
								<c:if test="${page == false}">
									<div class="col-md-6 text-center text-md-left mb-4 mb-md-0">
										<p class="ml-3">Chưa có nhà hão tâm quyên góp.</p>
									</div>
								</c:if>
							</div>
							<!-- Pagination -->
							<c:if test="${page == true}">
								<div class="row d-flex justify-content-between"> 
									<div class="col-md-6 text-center text-md-left mb-4 mb-md-0 ">
										<div class="ml-5">
											<c:out value="${firstObjectOnPage}" />
											to
											<c:out value="${lastObjectOnPage}" />
											of
											<c:out value="${totalItems}" />
										</div>
									</div>
									<div class="col-md-6 text-center text-md-right">
										<div class="custom-pagination ml-auto">
											<c:choose>
												<c:when test="${pageNo > 1}">
													<a href="?pageNo=${pageNo-1}" class="prev">Prev</a>
												</c:when>
											</c:choose>
											<div class="d-inline-block">
												<c:forEach var="i" begin="${startPage}" end="${endPage}">
													<c:choose>
														<c:when test="${i == pageNo}">
															<span class="changing">${i}</span>
														</c:when>
														<c:otherwise>
															<c:choose>
																<c:when test="${userDonations != null}">
																	<c:choose>
																		<c:when test="${i != pageNo && i <= totalPages}">
																			<a href="<c:url value='/admin/detailDonation/${donation.id}'/>?pageNo=${i}">${i}</a>
																		</c:when>
																		<c:otherwise>
																			<a href="<c:url value='/admin/detailDonation/${donation.id}'/>?pageNo=${i}">${i}</a>
																		</c:otherwise>
																	</c:choose>
																</c:when>
															</c:choose>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${pageNo < totalPages}">
														<a href="?pageNo=${pageNo+1}" class="next">Next</a>
													</c:when>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							<!-- Pagination -->
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
		<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid px-4"></div>
		</footer>
	</div>



</body>

</html>