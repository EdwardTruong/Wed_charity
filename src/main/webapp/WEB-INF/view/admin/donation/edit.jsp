<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Donation</title>
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
					<form:form
						action="${pageContext.request.contextPath}/admin/updateDonation"
						method="post" modelAttribute="donation">
						<form:input type="hidden" path="id" value="${donation.id}" />
						<form:input type="hidden" path="money" value="${donation.money}" />
						<div class="container-fluid px-4">
							<div class="card mb-4">
								<div class="card-header">
									<h5 class="mt-4">${pageTitle}</h5>
									 <c:if test="${sessionScope.success != null}">
										<p class="alert alert-success text-center">${sessionScope.success}</p>
										<c:remove var="success" scope="session"/>
										</c:if>
								</div>

								<div class="card-body">

									<div class="row py-2">
										<div class="col-6 py-2">
											<label for="code" class="col-fo rm-label">Mã đợt
												quyên góp:</label>
											<form:input id="code" type="text" class="form-control mb-3"
												path="code" />
											<div class="mt-2">
												<form:errors path="code" class="alert alert-warning ml-3"
													style="width: 93%;" />
											</div>

										</div>
										<div class="col-6  py-2">
											<label for="name" class="col-fo rm-label">Tên đợt
												quyên góp:</label>
											<form:input id="name" type="text" class="form-control mb-3"
												path="name" />
											<div class="mt-2">
												<form:errors path="name" class="alert alert-warning ml-3"
													style="width: 93%;" />
											</div>
										</div>
									</div>

									<!--date-->
									<div class="row">
										<div class="col-6  my-2">
											<label class="col-form-label">Ngày bắt đầu:</label>
											<form:input path="startDate" type="date"
												class="form-control mb-3" />
											<div class="mt-2">
												<form:errors path="startDate"
													class="alert alert-warning ml-3" style="width: 93%;" />
												<c:if test="${errorDate == true}">
													<div class="alert alert-warning ml-3" style="width: 93%;">Ngày
														bắt đầu và ngày kết thúc sai.</div>
												</c:if>
											</div>
										</div>
										<div class="col-6  my-2">
											<label class="col-form-label">Ngày kết thúc:</label>
											<form:input path="endDate" type="date"
												class="form-control mb-3" />
											<div class="mt-2">
												<form:errors path="endDate" class="alert alert-warning ml-3"
													style="width: 93%;" />
												<c:if test="${errorDate == true}">
													<div class="alert alert-warning ml-3" style="width: 93%;">Ngày
														bắt đầu và ngày kết thúc sai.</div>
												</c:if>
											</div>


										</div>
									</div>

									<!--Tổng số tiền trạng thái-->
									<div class="row">
										<div class="col-6  my-2">
											<label class="col-form-label">Tổng tiền quyên góp:</label> <input
												class="form-control mb-3" readonly="readonly"
												value="${donated}">
										</div>
										<div class="col-6  my-2">
											<label for="status" class="col-form-label">Trạng
												thái:</label>

											<c:if test="${donation.status < 3}">
												<form:select id="status" path="status"
													class="form-control mb-3">
													<form:option value="-1">----</form:option>
													<form:option value="0">Mới tạo</form:option>
													<form:option value="1">Đang quyên góp</form:option>
													<form:option value="2">Kết thúc quyên góp</form:option>
													<form:option value="3">Đóng quyên góp</form:option>
												</form:select>
												<div class="mt-2">
													<form:errors path="status" class="alert alert-warning ml-3"
														style="width: 93%;" />
												</div>
											</c:if>
											<c:if test="${donation.status == 3}">
												<input value="Đóng quyên góp" class="form-control mb-3"
													readonly="readonly" />
												<form:input id="status" name="status" type="hidden"
													path="status" value="${3}" />
											</c:if>
										</div>
									</div>

									<!--Tổ chức & số đt-->
									<div class="row">
										<div class="col-6  my-2">
											<label for="organizationName" class="col-fo rm-label">Tổ
												chức:</label>

											<form:input path="organizationName" id="organizationName"
												type="text" class="form-control mb-3" />
											<form:errors path="organizationName"
												class="alert alert-warning ml-3" style="width: 93%;" />
										</div>
										<div class="col-6  my-2">
											<label for="phoneNumber" class="col-form-label">Số
												điện thoại:</label>
											<form:input id="phoneNumber" type="number"
												class="form-control mb-3" path="phoneNumber" />
											<form:errors path="phoneNumber"
												class="alert alert-warning ml-3" style="width: 93%;" />
										</div>
									</div>

									<!--Địa điểm & nội dung-->
									<div class="row  my-2">
										<div class="col-12">
											<label for="loacl" class="col-form-label">Địa điểm:</label>
											<form:input path="local" id="local" type="text"
												class="form-control mb-3" />
											<form:errors path="local" class="alert alert-warning ml-3"
												style="width: 93%;" />
										</div>
										<div class="col-12  my-2">
											<label class="col-form-label">Nội dung:</label>
											<form:textarea class="form-control custom-input mb-3"
												rows="3" path="description"></form:textarea>
											<div class="mt-2">
												<form:errors path="description"
													class="alert alert-warning ml-3" style="width: 93%;" />
											</div>
										</div>
									</div>
									<div class="d-flex justify-content-between">
										<div>
											<a href="${pageContext.request.contextPath}/admin/donations"
												type="button" style="width: 80px"
												class="btn btn-secondary m-2"> Cancel </a>
										</div>
										<div>
											<!--Xóa donation !  -->
											<button data-toggle="modal" type="button"
												class="btn btn-danger "
												data-target="#deleteDonationModal${donation.id}"
												style="width: 80px; height: 37.5px">Xóa</button>

											

											<input class="btn btn-primary m-2"
												style="width: 80px; background-color: dodgerblue;"
												type="submit" value="Lưu" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</form:form>
					<!--Detail-->

					<div id="userDonationList">
						<div>
							<h3 class="mt-4 ml-3">Danh sách nhà hảo tâm</h3>
							<c:if test="${not empty param.success}">
								<div class="alert alert-success text-center">${success}</div>
							</c:if>

						</div>
						<table>
							<thead>
								<tr style="background-color: gray !important;">
									<th>Họ Tên</th>
									<th>Tiền quyên góp</th>
									<th>Nội dung</th>
									<th>Trạng thái</th>
									<th>Hành động</th>
								</tr>
							</thead>

							<tbody>

								<c:forEach var="userDonate" items="${userDonations}">
									<tr>
										<td>${userDonate.name}</td>
										<td>${userDonate.money}</td>
										<td>${userDonate.text}</td>

										<c:choose>
											<c:when test="${userDonate.status eq '0'}">
												<td>Chờ xác nhận</td>
											</c:when>
											<c:when test="${userDonate.status eq '1'}">
												<td>Đã xác nhận</td>
											</c:when>
											<c:when test="${userDonate.status eq '2'}">
												<td>Đã từ chối</td>
											</c:when>
										</c:choose>

										<td><c:if test="${userDonate.status == 0}">
												<button data-target="#addMoneyModal${userDonate.id}"
													data-toggle="modal" type="button"
													style="width: 150px; height: 37.5px;"
													class="btn btn-success">Xác nhận</button>

												<button data-target="#deniedMoneyModal${userDonate.id}"
													data-toggle="modal" type="button" 
													style="width: 150px; height: 37.5px;"
													class="btn btn-danger">Hủy xác nhận</button>

												<button data-target="#deleteUserDonationModal${userDonate.id}"
													data-toggle="modal" type="button" 
													style="width: 150px; height: 37.5px;"
													class="btn btn-danger">Xóa quyên góp</button>
													
												<!-- 	Modal appear add -->
												<div class="modal fade" id="addMoneyModal${userDonate.id}"
													tabindex="-1" role="dialog"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog modal-lg">

														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title ml-5" id="addMoneyModal">Xác
																	nhận quyên góp và không thể hoàn lại !</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>

															<div class="modal-body d-flex justify-content-around">
																<ul>
																	<li>Id:</li>
																	<li>Tên nhà hảo tâm:</li>
																	<li>Số tiền ủng hộ</li>
																</ul>
																<ul>
																	<li>${userDonate.id}</li>
																	<li>${userDonate.name}</li>
																	<li>${userDonate.money}</li>
																</ul>
															</div>

															<div class="modal-footer mb-3 ">
																<button class="btn btn-secondary mr-3"
																	data-dismiss="modal" style="width: 80px">Đóng</button>
																<form
																	action="${pageContext.request.contextPath}/admin/updateDonated"
																	method="post">
																	<input type="hidden" name="userDonationId"
																		value="${userDonate.id}" /> <input type="hidden"
																		name="donationId" value="${donation.id}"> <input
																		type="submit" style="width: 150px; height: 37.5px;"
																		class="btn btn-success" value="Xác nhận" />
																</form>
															</div>
														</div>
													</div>
												</div>
												<!-- 	Modal appear -->
												<!-- 	Modal appear denied -->
												<div class="modal fade"
													id="deniedMoneyModal${userDonate.id}" tabindex="-1"
													role="dialog" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog modal-lg">

														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title ml-5" id="addMoneyModal">Xác
																	nhận quyên hủy số tiền quyên góp !</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>

															<div class="modal-body d-flex justify-content-around">
																<ul>
																	<li>Id:</li>
																	<li>Tên nhà hảo tâm:</li>
																	<li>Số tiền ủng hộ</li>
																</ul>
																<ul>
																	<li>${userDonate.id}</li>
																	<li>${userDonate.name}</li>
																	<li>${userDonate.money}</li>
																</ul>
															</div>

															<!-- Nút cancel & hủy Xóa d-flex justify-content-center -->
															<div class="modal-footer mb-3 ">
																<button class="btn btn-secondary mr-3"
																	data-dismiss="modal" style="width: 80px">Đóng</button>
																<form
																	action="${pageContext.request.contextPath}/admin/deniedDonated"
																	method="post">
																	<input type="hidden" name="userDonationId"
																		value="${userDonate.id}" /> <input type="hidden"
																		name="donationId" value="${donation.id}"> <input
																		type="submit" style="width: 150px; height: 37.5px;"
																		class="btn btn-danger" value="Hủy xác nhận" />
																</form>
															</div>
														</div>
													</div>
												</div>
												<!-- 	Modal appear -->
												
											</c:if>
											
											<c:if test="${userDonate.status != 0}">
										<button data-target="#deleteUserDonationModal${userDonate.id}"
													data-toggle="modal" type="button" 
													style="width: 150px; height: 37.5px;"
													class="btn btn-danger">Xóa quyên góp</button>
										</c:if>
											</td>
									</tr>
<!-- Modal appear delete -->
												<div class="modal fade"
													id="deleteUserDonationModal${userDonate.id}" tabindex="-1"
													role="dialog" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog modal-lg">

														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title ml-5" id="addMoneyModal">Xác
																	nhận xóa số tiền này !</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body d-flex justify-content-around">
																<ul>
																	<li>Id:</li>
																	<li>Tên nhà hảo tâm:</li>
																	<li>Số tiền ủng hộ</li>
																	<li>Trạng thái</li>
																</ul>
																<ul>
																	<li>${userDonate.id}</li>
																	<li>${userDonate.name}</li>
																	<li>${userDonate.money}</li>
																	<c:choose>
																	<c:when test="${userDonate.status eq '0'}">
																		<li>Chưa xác nhận</li>
																	</c:when>
																	<c:when test="${userDonate.status eq '1'}">
																		<li>Đã xác nhận.</li>
																	</c:when>
																	<c:when test="${userDonate.status eq '2'}">
																		<li>Đã bị hủy</li>
																	</c:when>
																</c:choose>
																</ul>
															</div>


															<div class="modal-footer mb-3 ">
																<button class="btn btn-secondary mr-3"
																	data-dismiss="modal" style="width: 80px">Đóng</button>
																<form
																	action="${pageContext.request.contextPath}/admin/deleteUserDonation"
																	method="post">
																	<input type="hidden" name="userDonationId"
																		value="${userDonate.id}" /> <input type="hidden"
																		name="donationId" value="${donation.id}"> <input
																		type="submit" style="width: 150px; height: 37.5px;"
																		value="Xóa" class="btn btn-danger ml-3" />
																</form>
															</div>
														</div>
													</div>
												</div>
											<!-- Modal appear delete UserDonation -->
								</c:forEach>
							</tbody>
						</table>
						
						
						<!-- Modal appear  delete a donation--><div class="modal fade"
													id="deleteDonationModal${donation.id}" tabindex="-1"
													role="dialog" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog modal-lg">

														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title ml-5" id="addMoneyModal">Xác
																	nhận xóa đợi quyên góp này !</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body d-flex justify-content-around">
																<ul>
																	<li>Id:</li>
																	<li>Tên nhà hảo tâm:</li>
																	<li>Số nhà hảo tâm đã quyên góp</li>
																	<li>Số tiền đã quyên góp được</li>
																</ul>
																<ul>
																	<li>${donation.id}</li>
																	<li>${donation.name}</li>
																	<li>${numberSize}</li>
																	<li>${donated}</li>
																	
																</ul>
															</div>


															<div class="modal-footer mb-3 ">
																<button class="btn btn-secondary mr-3"
																	data-dismiss="modal" style="width: 80px">Đóng</button>
																<form action="${pageContext.request.contextPath}/admin/deleteDonation" method="post">
																	<input type="hidden" name="userDonationId"
																		value="${userDonate.id}" /> <input type="hidden"
																		name="idDonation" value="${donation.id}"> <input
																		type="submit" style="width: 150px; height: 37.5px;"
																		value="Xóa" class="btn btn-danger ml-3" />
																</form>
															</div>
														</div>
													</div>
												</div>	<!-- 	Modal appear -->
						
						
						<!-- Pagination -->
						<c:if test="${page == true}">
							<div class="row d-flex justify-content-between my-2">
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
																		<a
																			href="<c:url value='/admin/editDonation/${donation.id}'/>?pageNo=${i}">${i}</a>
																	</c:when>
																	<c:otherwise>
																		<a
																			href="<c:url value='/admin/editDonation/${donation.id}'/>?pageNo=${i}">${i}</a>
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
				</main>
			</div>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4"></div>
			</footer>
		</div>
	</div>
</body>

</html>