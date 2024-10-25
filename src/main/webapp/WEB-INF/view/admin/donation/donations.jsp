<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Donations</title>
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
		<!--Nav-->
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
<!--Nav-->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Danh sách các đợt quyên góp</h1>
					<div class="card mb-4">
						<div class="card-header">
						
						<c:if test="${sessionScope.message != null}">
								<div   class="alert alert-success text-center" >${sessionScope.message}</div>
							    <c:remove var="message" scope="session"/>
							</c:if>
						
						<c:if test="${sessionScope.error != null}">
								<div   class="alert alert-warning text-center" >${sessionScope.error}</div>
							    <c:remove var="error" scope="session"/>
							</c:if>
							
					
							<div class="d-flex justify-content-between">
								<!--Create new donation-->

							<button type="button" class="btn btn-success" data-bs-target="#exampleModalAdd" data-bs-toggle="modal">Thêm mới</button>
										
								<!-- Modal Add-->
								<div class="modal fade" id="exampleModalAdd" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabelll">Thêm
													mới</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<form:form action="${pageContext.request.contextPath}/admin/addNewDonation" method="post"
													enctype="multipart/form-data" modelAttribute="newDonation">
													<div class="row">
														<div class="col-6">
															<label class="col-form-label">Mã đợt quyên góp:</label> 
															<form:input path="code" type="text" class="form-control" />
															<div>
															<form:errors path="code" class="alert alert-warning"/>	
															</div>
															
														</div>
														<div class="col-6">
															<label class="col-form-label">Tên đợt quyên góp:</label>
															<form:input type="text" class="form-control" id="addcost" path="name"/>
															<div>
															<form:errors path="name" class="alert alert-warning"/>
															</div>
															
														</div>
													</div>
													<div class="row">
														<div class="col-6">
															<label class="col-form-label">Ngày bắt đầu:</label> 
															<form:input type="date" class="form-control" path="startDate"/>
															<div><form:errors path="startDate" class="alert alert-warning"/>
															</div>
															
														</div>
														<div class="col-6">
															<label class="col-form-label">Ngày kết thúc:</label> 
															<form:input  path="endDate" type="date" class="form-control" />
															<div>	<form:errors path="endDate" class="alert alert-warning"/>
															</div>
														
														</div>
													</div>
													<div class="row">
														<div class="col-6">
															<label class="col-form-label">Tổ chức:</label> 
															<form:input  type="text" class="form-control" path="organizationName"/>
															<div>
															<form:errors path="organizationName" class="alert alert-warning"/>
															</div>
														</div>
														<div class="col-6">
															<label class="col-form-label">Số điện thoại:</label> 
															<form:input  path="phoneNumber" type="number" class="form-control" />
															<div>
															<form:errors path="phoneNumber" class="alert alert-warning"/>
															</div>
														</div>
														<div class="col-12">
															<label class="col-form-label">Nội dung:</label>
															<form:textarea path="description" class="form-control" placeholder="Nội dung" cols="50" rows="5"/>
															<div>
															<form:errors   path="description" class="alert alert-warning"/>
															</div>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Đóng</button>
														<input type="submit" class="btn btn-primary" value="Thêm mới"/>
														
													</div>
												</form:form>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal Add-->



								<!--input find donation-->
								<form action="${pageContext.request.contextPath}/admin/dfind/${1}" method="GET">
									<div class="input-group input-group-sm mr-3"
										style="width: 500px;">
										<!--<label>Tìm tên mã quyên góp : </label>-->
										
										
										<c:if test="${sessionScope.searching == null}">
										<input type="text" name="searching" class="form-control float-right" placeholder="Mã - SĐT - Tổ Chức - Trạng thái" />
									</c:if>
									<c:if test="${sessionScope.searching != null}">
										<input type="text" name="searching" class="form-control float-right" value="${searching}" placeholder="Mã - SĐT - Tổ Chức - Trạng thái" /><!-- th:value="${input}" -->
									 <%-- <c:remove var="searching" scope="session"/> --%>
										   <%-- turn off it because the value of searching be removed when next page --%>
									</c:if>
					
										<div class="input-group-append">
											<button type="submit" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
							<!-- Modal Add-->
							<div class="card-body" style="width: auto">
								<table>
									<thead>
										<tr style="background-color: gray !important;">
											<th>Mã</th>
											<th>Tên</th>
											<th>Ngày bắt đầu</th>
											<th>Ngày kết thúc</th>
											<th>Tổ chức</th>
											<th>Số điện thoại</th>
											<th>Tổng tiền</th>
											<th>Trạng thái</th>
											<th style="width: 220px">Hành động</th>
										</tr>
									</thead>
										<c:forEach var="donation" items="${donations}">
											<tr>
												<td >${donation.code}</td>
												<td >${donation.name}</td>
												<td >${donation.startDate}</td>
												<td >${donation.endDate}</td>
												<td >${donation.organizationName}</td>
												<td >${donation.phoneNumber}</td>
												<td >${donation.money}</td>
												
												<c:choose>
													<c:when test="${donation.status eq '0'}">
													<td>Mới tạo</td>
													</c:when>
													<c:when test="${donation.status eq '1'}">
													<td>Đang q.góp</td>
													</c:when>
													<c:when test="${donation.status eq '2'}">
													<td>Kết thúc q.góp</td>
													</c:when>
													<c:when test="${donation.status eq '3'}">
													<td>Đóng q.góp</td>
													</c:when>
												</c:choose>
												<td>
													<div class="d-flex">
														<a href="${pageContext.request.contextPath}/admin/detailDonation/${donation.id}">
															<button type="button" style="width: 80px"
																class="btn btn-success mr-3" data-bs-toggle="modal">Chi
																tiết</button></a>
														 <a href="${pageContext.request.contextPath}/admin/editDonation/${donation.id}">

															<button type="button" style="width: 100px"
																class="btn btn-success mx-3" data-bs-toggle="modal">Cập
																nhật</button>
														</a>
														<!--Delete-->
														<button type="button" class="btn btn-danger"
															data-bs-target="#exampleModalDelete${donation.id}"
															data-bs-toggle="modal">Xóa</button>


													</div> <!-- Modal appear -->
													<div class="modal fade overlay"
														id="exampleModalDelete${donation.id}" tabindex="-1"
														aria-labelledby="exampleModalLabel" aria-hidden="true">
														<div class="modal-dialog modal-lg">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabel">
																		Xóa tất cả mọi thứ về đợt quyên góp ?</h5>

																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<div class="modal-body">
																	<div class="d-flex">
																		<label>Tên đợt quyên góp :</label> 
																		<span>${donation.name}</span>
																			
																	</div>
																	<br>
																	<div class="d-flex">
																		<label>Số tiền đã quyên góp được : </label> 
																		<span>${donation.money}</span>
																			
																	</div>
																	<br>
																</div>

																<div class="d-flex justify-content-center mb-3 ">
																	<button type="button" class="btn btn-secondary"
																		data-bs-dismiss="modal">Hủy</button>
																		<form:form action="${pageContext.request.contextPath}/admin/deleteDonation" method="post">
																		<input type="hidden" name="idDonation" value="${donation.id}">
																		<input type="submit" class="btn btn-danger ml-3" style="width: 80px" value="Xóa">
																		</form:form>
																</div>
															</div>
														</div>
													</div> <!-- Modal appear-->
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

	
	
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
												<c:when test="${currentPage > 1}">
												
													<c:if test="${founder}">
														<a href="${pageContext.request.contextPath}/admin/dfind/${currentUserPage - 1}?searching=${sessionScope.searching}" class="prev">Prev</a>
														
													</c:if>
												
												<c:if test="${!founder}">
													<a class="next" href="<c:url value='/admin/pageDonation/'/>${currentPage - 1}">Prev</a>
												
												</c:if>
												</c:when>
												<c:otherwise>
													<!-- Handle any other case if needed -->
												</c:otherwise>
											</c:choose>
											<div class="d-inline-block">
												<c:forEach var="i" begin="1" end="${totalPages}">
													<c:choose>
														<c:when test="${i == currentPage}">
															<span class="changing">${i}</span>
														</c:when>
														<c:otherwise>
															<c:choose>
																<c:when test="${donations != null}">
																	<c:choose>
																		<c:when test="${i != currentPage && input != null}">
																			
																		<c:if test="${!founder}">
																			<a href="<c:url value='/admin/pageDonation/'/>${i}?input=${input}">${i}</a>																
																		</c:if>
																		
																		<c:if test="${founder}">
																			<a class="page-link" href="${pageContext.request.contextPath}/admin/dfind/${i}?searching=${sessionScope.searching}">${i}</a>																
																		</c:if>
																			
																			
																				
																		</c:when>
																		<c:otherwise>
																		
																		<c:if test="${!founder}">
																			<a href="<c:url value='/admin/pageDonation/'/>${i}">${i}</a>																	
																		</c:if>
																		<c:if test="${founder}">
																		 <a href="<c:url value='/admin/dfind/${i}?searching=${sessionScope.searching}'/>">${i}</a> 
																		</c:if>
																		
																			
																		</c:otherwise>
																	</c:choose>
																</c:when>
															</c:choose>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${currentPage < totalPages}">
														
															<c:if test="${!founder}">
																<a class="next" href="<c:url value='/admin/pageDonation/'/>${currentPage + 1}">Next</a>
															</c:if>
															<c:if test="${founder}">
																<a href="${pageContext.request.contextPath}/admin/dfind/${currentUserPage + 1}?searching=${sessionScope.searching}" class="prev">Next</a>
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