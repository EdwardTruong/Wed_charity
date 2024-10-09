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
<title>ADMIN HOME</title>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	
<link href="${pageContext.request.contextPath}/resources/static/admin1/assets/css/styles.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/static/user/assets/css/custom-bs.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/static/user/assets/css/style.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/scripts.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/datatables-simple-demo.js}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
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
				<h1>Home admin</h1>
			<div class="ml-3 mb-3">
				<a href="${pageContext.request.contextPath}/home"><button class="btn btn-success">HOME PAGE</button></a>
			</div>	
				
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4"></div>
			</footer>
		</div>
	</div>
	<script>
      $("#exampleModalView1").on("hidden.bs.modal", function (e) {
        $("#exampleModalView1 iframe").attr(
          "src",
          $("#exampleModalView1 iframe").attr("src")
        );
      });
    </script>
	<script>
      $(document).ready(function () {
        $("#autoWidth,#autoWidth2").lightSlider({
          autoWidth: true,
          loop: true,
          onSliderLoad: function () {
            $("#autoWidth,#autoWidth2").removeClass("cS-hidden");
          },
        });
      });
    </script>
	<script>
      ClassicEditor.create(document.querySelector("#editor"))
        .then((eidt) => {
          console.log("da" + eidt);
        })
        .catch((error) => {
          console.error(error);
        });
    </script>
	<script>
      ClassicEditor.create(document.querySelector("#editor1"))
        .then((eidt) => {
          console.log("da" + eidt);
        })
        .catch((error) => {
          console.error(error);
        });
    </script>
	<script src="js/JQuery3.3.1.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
