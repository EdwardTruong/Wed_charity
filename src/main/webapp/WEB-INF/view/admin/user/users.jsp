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
<title>USES</title>

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
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Danh sách người dùng</h1>
					<div class="card mb-4">
						<div class="card-header">

							
							
							
							<c:if test="${sessionScope.success != null}">
								<p class="alert alert-success text-center">${sessionScope.success}</p>
							    <c:remove var="success" scope="session"/>
							</c:if>

							<c:if test="${sessionScope.error != null}">
								<p class="alert alert-success text-center">${sessionScope.error}</p>
							    <c:remove var="error" scope="session"/>
							</c:if>
							<div class="d-flex justify-content-between">
							<a href="${pageContext.request.contextPath}/admin/showFormAddNewUser/${user.id}">
								<button type="button" style="width: 120px"class="btn btn-success mr-3" data-bs-toggle="modal">Thêm mới</button></a>	
							<form action="${pageContext.request.contextPath}/admin/find/${1}" method="GET">
								<div class="input-group input-group-sm mr-3"
									style="width: 300px;">
									<c:if test="${sessionScope.searching == null}">
										<input type="text" name="searching" class="form-control float-right" placeholder="Search Email - SĐT" />
									</c:if>
									<c:if test="${sessionScope.searching != null}">
										<input type="text" name="searching" class="form-control float-right" value="${searching}" placeholder="Search Email - SĐT" /><!-- th:value="${input}" -->
									    <c:remove var="input" scope="session"/>
									</c:if>
									
									
									<div class="input-group-append">
										<button type="submit" class="btn btn-default">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</form>
							
							
							</div>
							
						</div>
						<!-- Modal Add-->
						<div class="card-body" style="width: auto;">
							<!--  id="datatablesSimple"  Cái nút lên xuống của từng cột trong bài mẫu boottrap 5 https://datatables.net/-->
						
							
							<table id="table">
								<thead>
									<tr style="background-color: gray !important;">
										<th>Họ tên</th>
										<th>Email</th>
										<th>Số điện thoại</th>
										<th>Tên tài khoản</th>
										<th>Vai trò</th>
										<th>Trạng thái</th>
										<th class="ml-5">Hành động</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="user" items="${users}">
										<tr>
											<td>${user.fullName}</td>
											<td>${user.email}</td>
											<td>${user.phoneNumber}</td>
											<td>${user.userName}</td>
											

										 <c:if test="${sessionScope.searching == null}">	
											<c:choose>
												<c:when test="${user.roleEntity.id == '1'}">
													<td>ADMIN</td>
												</c:when>
												<c:when test="${user.roleEntity.id == '2'}">
													<td>USER</td>
												</c:when>
											</c:choose>
											<c:remove var="searching" scope="session"/>
										</c:if> 	
									
										
										<c:if test="${sessionScope.searching != null || sessionScope.searching != ''}">
											<c:choose>
												<c:when test="${user.roleId == '1'}">
													<td>ADMIN</td>
												</c:when>
												<c:when test="${user.roleId eq '2'}">
													<td>USER</td>
												</c:when>
											</c:choose>
											
										    <%-- <c:remove var="searching" scope="session"/> --%>
										   <%-- turn off it because the value of searching be removed when next page --%>
										</c:if>

										<c:if test="${user.roleEntity.id != 1 || user.roleId != '1'}">
												<c:choose>
													<c:when test="${user.status eq '0'}">
														<td>Khóa</td>
													</c:when>
													<c:when test="${user.status eq '1'}">
														<td>Hoạt động</td>
													</c:when>
												</c:choose>
											</c:if>
											<td style="width: 370px;">
												<div class="d-flex">
													<a
														href="${pageContext.request.contextPath}/admin/detailUser/${user.id}">
														<button type="button" style="width: 80px"
															class="btn btn-success mr-3" data-bs-toggle="modal">Chi
															tiết</button>
													</a> <a
														href="${pageContext.request.contextPath}/admin/editUser/${user.id}">
														<button type="button" style="width: 80px"
															class="btn btn-success mx-3" data-bs-toggle="modal">Sữa
														</button>
													</a>
												</div>

												<div class="d-flex">
													<c:if test="${user.roleEntity.id != 1}">
														<form:form
															action="${pageContext.request.contextPath}/admin/changeStatutToLock/${user.id}"
															method="POST">
															<c:if test="${user.status== 0}">
																<button type="submit" class="btn btn-success mt-2 mr-3 ">Mở
																	Khoá</button>
															</c:if>
															<c:if test="${user.status == 1}">
																<button style="width: 80px; height: 37, 5px"
																	type="submit" class="btn btn-danger mt-2 mr-3">Khóa</button>
															</c:if>
														</form:form>



														<c:if test="${user.roleEntity.id != 1}">
															<button data-toggle="modal" type="button"
																class="btn btn-danger mx-3 mt-2"
																data-target="#aModel${user.id}"
																style="width: 80px; height: 37.5px">Xóa</button>
														</c:if>
													</c:if>
												</div>

												<div id="aModel${user.id}" class="modal fade" tabindex="-1"
													role="dialog" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="modalLabelDelete">Bạn
																	muốn xóa người dùng</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<label class="col-sm-4 col-form-label">Tên người
																	dùng:</label> <span>${user.fullName}</span><br> <label
																	class="col-sm-4 col-form-label">Id:</label> <span>${user.id}
																</span>
															</div>
															<div class="modal-footer mb-3 ">
																<button type="button" class="btn btn-secondary mr-3"
																	data-dismiss="modal" style="width: 80px">Đóng</button>
																<form:form
																	action="${pageContext.request.contextPath}/admin/deleteUser"
																	method="POST">
																	<input type="hidden" name="id" value="${user.id}">
																	<input type="submit" class="btn btn-danger ml-3"
																		value="Xóa người dùng">
																</form:form>


															</div>
														</div>
													</div>
												</div>

											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
<c:if test="${sessionScope.searching == true}">

	<p>Ông nội mày</p>
</c:if>




				<!-- Pagination -->
				<c:if test="${page == true}">
					<div class="row pagination-wrap">
							<div class="col-md-6 text-center text-md-left mb-4 mb-md-0 ">
									<div class="ml-5">
									<c:out value="${firstObjectOnPage}" /> to
									<c:out value="${lastObjectOnPage}" /> of
									<c:out value="${totalItems}" />
									</div>
							</div>
							<c:if test="${all != 0}">
								<div class="col-md-6 text-center text-md-right">
									<div class="custom-pagination ml-auto">
										<div>
											<c:choose>
												<c:when test="${currentUserPage > 1}">
													<c:if test="${founder}">
														<a href="${pageContext.request.contextPath}/admin/find/${currentUserPage - 1}?searching=${sessionScope.searching}" class="prev">Prev</a>
														
													</c:if>
													<c:if test="${!founder}">
														<a href="<c:url value='/admin/pageUser/'/>${currentUserPage - 1}" class="next">Prev</a>
													</c:if>
												</c:when>
											</c:choose>
											<div class="d-inline-block">
												<c:forEach var="i" begin="1" end="${totalPages}">
													<c:choose>
														<c:when test="${i == currentUserPage}">
															<span class="changing">${i}</span>
														</c:when>
														
														<c:otherwise>
															<c:choose>
																<c:when test="${users != null}">
																	<c:choose>
																		<c:when test="${i != currentUserPage && totalUserOnAPage != 0 && input != null}">
																		<c:if test="${!founder}">
																			<a href="<c:url value='/admin/pageUser/'/>${i}?input=${input}">${i}</a>																		
																		</c:if>
																		
																		<c:if test="${founder}">
																			<a class="page-link" href="${pageContext.request.contextPath}/admin/find/${i}?searching=${sessionScope.searching}">${i}</a>																
																		</c:if>
																		
																		
																		</c:when>
																		<c:otherwise>
																		<c:if test="${!founder}">
																			<a href="<c:url value='/admin/pageUser/'/>${i}">${i}</a>																		
																		</c:if>
																		<c:if test="${founder}">
																		 <a href="<c:url value='/admin/find/${i}?searching=${sessionScope.searching}'/>">${i}</a> 
																		</c:if>
																		</c:otherwise>
																	</c:choose>
																</c:when>
															</c:choose>
														</c:otherwise>
														
													</c:choose>
												</c:forEach>
												
												<c:choose>
													<c:when test="${currentUserPage < totalPages }">
														<c:if test="${founder}">
															<a href="${pageContext.request.contextPath}/admin/find/${currentUserPage+1}?searching=${sessionScope.searching}" class="prev">Next</a>
														</c:if>
														<c:if test="${!founder}">
															<a href="<c:url value='/admin/pageUser/'/>${currentUserPage + 1}" class="next">Next</a>
														</c:if>
					
					
					
					
					
													</c:when>
													
													
												
													
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</div>
				</c:if>
				<!-- Pagination -->
			
			</main>
		</div>
	</div>


</body>

</html>