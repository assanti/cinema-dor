<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="com.cinema.dto.User"%>
<%
    String nomWeb = "CinemaDor";       
    
    //Coordenades localització
    float x = 167.23f;
    float y = 168.23f; 
    
    // Recuperan usuari de la sessió si existeix 
    User usuari = (User) session.getAttribute("user");
    request.setAttribute("usuari", usuari);
    
    // Recuperam genere per configurar el menú actiu

%>
<!doctype html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css?_cacheOverride=1574773860125" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Poppins|Varela+Round&display=swap" rel="stylesheet"> 
	<link rel="stylesheet" href="./css/styles.css">
	<title><%=nomWeb %></title>
</head>
<body background="./img/konak.jpg">
	<!-- Capçalera -->
	<header class="jumbotron jumbotron-fluid py-2 my-0">
		<div class="container-fluid">
			<div class="row">
				<div class="col-9" style="padding-left:90px">
					<h1 class="display-6"><%=nomWeb %></h1>
					<p class="lead">Un cinema únic per a tu</p>
				</div>
				<div class="col-3 text-right">
			        
					<c:set var="avui" value="<%=new java.util.Date()%>" />
			        <p>Avui:
			        <fmt:formatDate pattern = "dd-MM-yyyy" value = "${avui}" />
         			</p>
			        
				</div>
			</div>
		</div>
	</header>

	<!-- Menú de navegació -->
	<div class="sticky-top">
		<nav class="navbar navbar-expand-lg navbar-light bg-light  position-sticky shadow p-3 mb-0 bg-white rounded  fixed-bottom">
			<!-- Visible quan es fa petit -->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item">
						<a class="nav-link" href="/cinema/index.jsp">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/cinema/index.jsp?genere=FICCIO">Ciència ficció</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/cinema/index.jsp?genere=AVENTURES">Aventures</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/cinema/index.jsp?genere=TERROR">Terror</a><span class="sr-only">(current)</span>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/cinema/index.jsp?genere=DIBUIXOS">Dibuixos</a><span class="sr-only">(current)</span>
					</li>
					<c:if test = "${user==null}">
						<li><a class="nav-link" href="/cinema/login/user-login.jsp">Login</a></li>
			        </c:if>
			        <c:if test = "${user!=null}">
				        <li><a class="nav-link" href="#"></a><c:out value="${user.userName}"/></li>
			        </c:if>
				</ul>
				<form class="form-inline my-2 my-lg-0" action="/cinema/index.jsp">
					<input class="form-control mr-sm-2" name="search" type="search" placeholder="nom pel·lícula">
					<button class="btn btn-warning my-2 my-sm-0" type="submit">Cerca</button>
				</form>
			</div>
		</nav>
	</div>

       