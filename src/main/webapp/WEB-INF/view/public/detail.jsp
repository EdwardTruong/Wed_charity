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
<meta name="description" content="Detail of donation - main page" />
<meta name="author" content="truongFunix20125" />
<title>Detail donation</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Free-Template.co" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/ftco-32x32.png">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/user/assets/css/custom-bs.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/user/assets/css/jquery.fancybox.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/user/assets/css/bootstrap-select.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/user/assets/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/user/assets/fonts/line-icons/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/user/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/user/assets/css/animate.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/user/assets/css/style.css">

<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/isotope.pkgd.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/stickyfill.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.fancybox.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.easing.1.3.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.animateNumber.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/bootstrap-select.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/custom.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/user/assets/js/newJs.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body id="top">

	 	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border text-primary" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div> 
	 
	<c:if test="${sessionScope.msg != null}">
		<div class="toast" data-delay="1000"
			style="position: fixed; top: 100PX; left: 40PX; z-index: 2000; width: 300px">

			<script>
				swal({
					title : 'Donate Successfully!',
					/* text: 'Redirecting...', */
					icon : 'success',
					timer : 3000,
					buttons : true,
					type : 'success'
				})
			</script>
		</div>
		<c:remove var="error" scope="session" />
	</c:if>



	<div class="site-wrap">
		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>


		<!-- NAVBAR -->
		<header class="site-navbar mt-3">
			<div class="container-fluid">
				<div class="row align-items-center">
					<div class="site-logo col-6">
						<a href="${pageContext.request.contextPath}/">Website Quyên
							Góp</a>
					</div>
					<nav
						class="right-cta-menu text-right d-flex aligin-items-center col-6">
						<div class="ml-auto d-flex">
							<c:choose>
								<c:when
									test="${empty sessionScope.user and empty sessionScope.admin}">
									<a href="${pageContext.request.contextPath}/login"><button
											type="button" class="btn btn-secondary ">
											<span class="mr-2 icon-lock_outline"> </span> Đăng nhập
										</button></a>
								</c:when>
								<c:otherwise>
									<c:if test="${sessionScope.user != null}">
										<a
											href="${pageContext.request.contextPath}/user/info/${sessionScope.user.id}"
											class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">${sessionScope.user.fullName}</a>
									</c:if>
									<c:if test="${sessionScope.admin != null}">
										<a
											href="${pageContext.request.contextPath}/admin/detailUser/${sessionScope.admin.id}"
											class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">${sessionScope.admin.fullName}</a>
									</c:if>
									<a href="${pageContext.request.contextPath}/logout"
										class="btn btn-primary border-width-2 d-none d-lg-inline-block">Đăng
										xuất</a>
								</c:otherwise>
							</c:choose>
						</div>
					</nav>

				</div>
			</div>
		</header>
		<!-- MAIN -->
		<c:set var="imagePath"
			value="/resources/static/user/assets/images/hero_1.jpg" />
		<section class="section-hero overlay inner-page bg-image"
			style="background-image: url(${pageContext.request.contextPath}${imagePath});"
			id="home-section">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<h1 class="text-white font-weight-bold">Chi tiết đợt quyên
							góp</h1>
						<div class="custom-breadcrumbs"></div>
					</div>
				</div>
			</div>
		</section>

		<section class="site-section">
			<div class="container">
			
				<c:if test="${sessionScope.success != null}">
					<div class="alert alert-success text-center">${success}</div>
					<c:remove var="success" scope="session" />
				</c:if>
				
				
				<c:if test="${sessionScope.error != null}">
					<div class="alert alert-warning text-center">${error}</div>
					<c:remove var="error" scope="session" />
				</c:if>
				<div class="row">
					<div class="col-lg-6">
						<div class="mb-5">
							<h3 class="h5 d-flex align-items-center mb-4 text-primary">
								<span class="icon-align-left mr-3"></span>Nội dung của đợt quyên
								góp
							</h3>
							<span>${donation.description}</span>
						</div>

						<div class="pt-5">
							<h3 class="mb-5">${donationSize}</h3>
							<table class="outside-info">
								<tbody>
									<tr>
										
										<th>Tên</th>
										<th>Đã quyến góp</th>
										<th>Ngày quyên góp</th>
										<th>Trạng thái</th>
									</tr>

									<c:forEach var="user" items="${userDonations}">
										<tr>
											
											<th>${user.name}</th>
											<th>${user.money}</th>
											<th>${user.created}</th>

											<c:choose>
												<c:when test="${user.status eq '0'}">
													<th>Chưa xác nhận</th>
												</c:when>
												<c:when test="${user.status eq '1'}">
													<th>Đã nhận</th>
												</c:when>
												<c:when test="${user.status eq '2'}">
													<th>Từ chối</th>
												</c:when>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>

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
																<c:when test="${userDonation != null}">
																	<c:choose>
																		<c:when test="${i != pageNo}">
																			<a href="<c:url value='/detail/${donation.id}'/>?pageNo=${i}">${i}</a>
																		</c:when>
																		<c:otherwise>
																			<a href="<c:url value='/detail/${donation.id}/'/>${i}">${i}</a>
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

					<!-- Donation info -->
					<div class="col-lg-6">
						<div class="bg-light p-3 border rounded mb-4"
							style="width: max-content;">
							<h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Thông tin</h3>
							<div class="d-flex justify-content-start">
								<ul class="list-unstyled pl-3 mb-0">
									<li class="mb-2"><strong class="text-black mr-5">Mã
											đợt quyên góp:</strong></li>
									<li class="mb-2"><strong class="text-black">Tên
											đợt quyên góp:</strong></li>
									<li class="mb-2"><strong class="text-black">Địa
											điểm:</strong></li>
									<li class="mb-2"><strong class="text-black mr-5">Ngày
											bắt đầu:</strong></li>
									<li class="mb-2"><strong class="text-black mr-5">Ngày
											kết thúc:</strong>
									<li class="mb-2"><strong class="text-black mr-5">Cá
											nhân/Tổ chức:</strong></li>
									<li class="mb-2"><strong class="text-black mr-5">Số
											điện thoại: </strong></li>
									<li class="mb-2"><strong class="text-black mr-5">Tổng
											quyên góp đã nhận: </strong></li>
									<li class="mb-2"><strong class="text-black mr-5">Trạng
											thái:</strong></li>
								</ul>

								<ul class="list-unstyled pl-3 mb-0">
									<li class="mb-2">${donation.code}</li>
									<li class="mb-2">${donation.name}</li>
									<li class="mb-2">${donation.local}</li>
									<li class="mb-2">${startDate}</li>
									<li class="mb-2">${endDate}</li>
									<li class="mb-2">${donation.organizationName}</li>
									<li class="mb-2">${donation.phoneNumber}</li>
									<li class="mb-2">${donated}</li>
									<c:choose>
										<c:when test="${donation.status eq '0'}">
											<li>Mới tạo</li>
										</c:when>
										<c:when test="${donation.status eq '1'}">
											<li>Đang quyên góp</li>
										</c:when>
										<c:when test="${donation.status eq '2'}">
											<li>Đóng quyên góp</li>
										</c:when>
										<c:when test="${donation.status eq '3'}">
											<li>Kết thúc quyên góp</li>
										</c:when>
									</c:choose>
								</ul>
							</div>
							
								<c:if test="${sessionScope.user != null || sessionScope.admin != null }">
									 <c:if test="${donation.status <= 1}">
									<button data-toggle="modal" style="color: white" style="width: 110px"
										data-target="#exampleModal${donation.id}" type="submit"
										class="btn btn-block btn-primary btn-md">Quyên Góp</button>
									<!-- Modal appear-->
									<div class="modal fade" id="exampleModal${donation.id}"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Quyên
														góp</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<form:form
													action="${pageContext.request.contextPath}/saveUserDonation"
													method="post" modelAttribute="newUserDonation">

													<div class="modal-body">
														<div class="row">
															<div class="col-12">
																<label for="name" class="col-form-label">Tên nhà
																	hảo tâm:</label>
																<form:input type="text" class="form-control" path="name"
																	placeholder="Họ và tên người quyên góp" id="name" />
																	<c:if test="${sessionScope.errorName != null}">
																		<p class="alert alert-warning ml-3"
																	style="width: 93%;">${sessionScope.errorName}</p>
																	    <c:remove var="name" scope="session"/>
																	</c:if>
																	
																<label for="money" class="col-form-label">Số
																	tiền quyên góp:</label>
																<form:input path="money" type="number"
																	class="form-control" name="money"
																	placeholder="Số tiền tối thiểu là 10.000 VND"
																	id="money" />
																<c:if test="${sessionScope.errorMoney != null}">
																		<p class="alert alert-warning ml-3"
																	style="width: 93%;">${sessionScope.errorMoney}</p>
																	    <c:remove var="errorMoney" scope="session"/>
																</c:if>

																<label for="text" class="col-form-label">Lời
																	nhắn:</label>
																<form:textarea path="text" rows="10" cols="3"
																	class="form-control" id="text" name="text" />
																	<c:if test="${sessionScope.errorText != null}">
																		<p class="alert alert-warning ml-3"
																	style="width: 93%;">${sessionScope.errorText}</p>
																	    <c:remove var="errorText" scope="session"/>
																	</c:if>
																	
																<form:input type="hidden" name="donationId"
																	path="donationId" value="${donation.id}" />
																<form:input path="userId" type="hidden" name="userId"
																	value="${user.id}" />
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Đóng</button>
															<button type="submit" class="btn btn-primary">Quyên
																góp</button>
														</div>
													</div>
												</form:form>
											</div>
										</div>
									</div>
									<!-- Modal appear-->
									 </c:if> 
									<c:if test="${donation.status > 1}">
									<button  style="color: white" style="width: 110px"
											class="btn btn-block btn-primary btn-md btn-danger">Không thể</button></c:if>
								</c:if>
								
								<c:if test="${sessionScope.user == null && sessionScope.admin == null}">
									<a href="${pageContext.request.contextPath}/login">
									<button data-toggle="modal" style="color: white"
										class="btn btn-block btn-primary btn-md">Đăng nhập để quyên góp</button></a>
								</c:if>
					</div>
				</div>
				 <a href="${pageContext.request.contextPath}/home" type="button" style="width: 80px"
					class="btn btn-secondary m-2"> Back </a>
			</div>
	</div>
		</section>
	<jsp:include page="footer.jsp" />

	</div>

</body>

</html>