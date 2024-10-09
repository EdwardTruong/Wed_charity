<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>   
<!DOCTYPE html>
<html lang="vn">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Login - SB Admin</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/admin1/assets/css/styles.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">

<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Đăng nhập</h3></div>
                            <div class="card-body">
                                <form:form method='POST' action="processFormLogin" modelAttribute="userLoginDto">
                                    <div class="form-floating mb-3">
                                        <form:input class="form-control" id="inputEmail" path="username" type="text" placeholder="name@example.com" />
                                        <label for="inputEmail">Email</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <form:input class="form-control" id="inputPassword" path="password" type="password" placeholder="Password" />
                                        <label for="inputPassword">Mật khẩu</label>
                                    </div>
           
                                    <c:if test="${sessionScope.error != null}">
									    <p style="color: red">${sessionScope.error}</p>
    									<c:remove var="error" scope="session"/>
									</c:if>
                                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
												<a href="${pageContext.request.contextPath}/home" type="button" style="width: 80px"
													class="btn btn-secondary m-2">
													Cancel
												</a>
												<button class="btn btn-primary " type="submit"
													style="margin-left: 250px !important;">Login</button>
											</div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/scripts.js"></script>
</body>
</html>