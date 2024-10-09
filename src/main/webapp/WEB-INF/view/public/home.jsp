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
<title>HOME</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Free-Template.co" />
<link rel="shortcut icon" href="ftco-32x32.png">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/css/custom-bs.css">
<link rel="stylesheet"
	 href="${pageContext.request.contextPath}/resources/static/user/assets/css/jquery.fancybox.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/user/assets/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/user/assets/fonts/line-icons/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/user/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/css/animate.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/user/assets/css/style.css">

<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/stickyfill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.fancybox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.easing.1.3.js"></script>

<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/user/assets/js/newJs.js"></script>

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
	    <c:remove var="error" scope="session"/>
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
						<a href="/">Website Quyên Góp</a>
					</div>
					<nav class="right-cta-menu text-right d-flex aligin-items-center col-6"> 
						<div class="ml-auto d-flex">
						<c:choose>
						    <c:when test="${empty sessionScope.user and empty sessionScope.admin}">
						        <a href="${pageContext.request.contextPath}/login"><button type="button" class="btn btn-secondary ">
						            <span class="mr-2 icon-lock_outline"> </span>
						            Đăng nhập
						        </button></a>
						    </c:when>
						    <c:otherwise>
						        <c:if test="${sessionScope.user != null}">
						            <a href="${pageContext.request.contextPath}/user/info/${sessionScope.user.id}"
						                class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">${sessionScope.user.fullName}</a>
						        </c:if>
						        <c:if test="${sessionScope.admin != null}">
						            <a href="${pageContext.request.contextPath}/admin/detailUser/${sessionScope.admin.id}"
						                class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">${sessionScope.admin.fullName}</a>
						        </c:if>		        
						        <a href="${pageContext.request.contextPath}/logout" class="btn btn-primary border-width-2 d-none d-lg-inline-block" >Đăng xuất</a>
						    </c:otherwise>
						</c:choose>
						</div>
					</nav>

				</div>
			</div>
		</header>

		<!-- HOME -->
		<c:set var="imagePath" value="/resources/static/user/assets/images/hero_1.jpg" />
		 <section class="section-hero overlay inner-page bg-image" id="home-section"
			style="background-image: url(${pageContext.request.contextPath}${imagePath});">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<h1 class="text-white font-weight-bold">Danh sách các đợt quyên góp</h1>
					</div>
				</div>
			</div>
		</section>

		<c:if test="${sessionScope.success != null}">
			<p style="color: red">${sessionScope.success}</p>
		    <c:remove var="error" scope="session"/>
		</c:if>

		<c:if test="${sessionScope.error != null}">
			<p style="color: red">${sessionScope.error}</p>
		    <c:remove var="error" scope="session"/>
		</c:if>
	
	

		<section class="site-section">
			<div class="container">

				<div class="row mb-5 justify-content-center">
					<div class="col-md-7 text-center">
						<h2 class="section-title mb-2">Các đợt quyên góp</h2>
					</div>
				</div>
				<ul>
					<c:forEach var="donation" items="${donations}">
					<li style="margin-bottom: 20px"
						class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center ">
						<div
							class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
							<div class="job-listing-position custom-width  mb-3 mb-sm-0"
								style="padding: 10px; width: 250px">
								<h3 >${donation.name}</h3>
							</div>
							<div class="job-listing-location mb-3 mb-sm-0 custom-width w-10"
								style="padding: 10px;">
								Ngày bắt đầu<br> <strong >${donation.startDate}</strong><br>
							</div>
							<div class="job-listing-location mb-3 mb-sm-0 custom-width w-10"
								style="padding: 10px;">
								Ngày kết thúc<br> <strong >${donation.endDate}</strong><br>
							</div>
							<div class="job-listing-location mb-3 mb-sm-0 custom-width w-25"
								style="padding: 10px;">
								<span class="icon-room"></span> 
								<span>${donation.organizationName}</span><br> <strong
									>${donation.phoneNumber}</strong><br>
							</div>
							<div class="job-listing-meta custom-width w-20 d-flex">
								<a href="${pageContext.request.contextPath}/detail/${donation.id}"
									style="text-decoration: none"> <input value="Chi tiết"
									class="btn btn-primary py-2 stype-btn" data-toggle="modal"
									type="button" />
								</a>

							<c:if test="${sessionScope.user != null || sessionScope.admin != null}">
								<c:choose>
									<c:when test="${donation.status <= 1}">
									<button data-toggle="modal"
										style="width: 110px"
										data-target="#exampleModal${donation.id}"
										type="submit" class="btn btn-primary stype-btn">
										Quyên Góp</button>
									</c:when>
									<c:when test="${donation.status > 1}">
									<button
										style="width: 110px"
										class="btn btn-primary stype-btn btn-danger">Không
										thể</button>
									</c:when>
								</c:choose>
							</c:if>
							</div>
						</div>
						 <!-- Modal appear-->
						<div class="modal fade" id="exampleModal${donation.id}"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Quyên góp</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form:form action="${pageContext.request.contextPath}/saveUserDonation" method="post" modelAttribute ="userDonation">
										
										<div class="modal-body">
											<div class="row">
												<div class="col-12">
													<label for="name" class="col-form-label">Tên nhà hảo tâm:</label> 
														
														<form:input type="text" class="form-control"
														path="name" placeholder="Họ và tên người quyên góp"
														id="name"/> 
														<label for="money" class="col-form-label">Số tiền quyên góp:</label> 
														
														<form:input path="money"
														type="number" class="form-control" name="money"
														placeholder="Số tiền tối thiểu là 10.000 VND" id="money"/>
														
													<label for="text" class="col-form-label">Lời nhắn:</label>
													<form:textarea path="text" rows="10" cols="3" class="form-control" id="text"
														name="text"/> 
														
													<form:input type="hidden" name="donationId" path="donationId"
														value="${donation.id}"/>
													<form:input path="userId" type="hidden" name="userId" value="${user.id}"/>
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
					</li>
				</c:forEach>		
				</ul>


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
													<a href="?pageUserNumber=${currentPage-1}" class="prev">Prev</a>
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
																		<c:when
																			test="${i != currentPage && input != null}">
																			<a
																				href="<c:url value='/page/'/>${i}?input=${input}">${i}</a>
																		</c:when>
																		<c:otherwise>
																			<a href="<c:url value='/page/'/>${i}">${i}</a>
																		</c:otherwise>
																	</c:choose>
																</c:when>
															</c:choose>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${currentPage < totalPages}">
														<a href="?pageUserNumber=${currentPage+1}"
															class="next">Next</a>
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
			</div>
		</section>
			<jsp:include page="footer.jsp" />
	</div>
</body>
</html>