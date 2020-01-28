<%@page import="java.time.LocalDate"%>
<%@page import="com.cinema.dto.User"%>
<%@page import="com.cinema.db.FilmBDService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int anysAniversari = 30;
    LocalDate dataFundacio = LocalDate.of(1986, 3, 11);
    //Coordenades localització
    float x = 167.23f;
    float y = 168.23f; 

    User usuari = (User)session.getAttribute("user");
    request.setAttribute("usuari", usuari); 
    
    //variables para traer listas
    
   
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cinema</title>
        <%--Favicon_ link --%>
        
        <link rel="icon" href="<c:url value="./img/cine_favicon"/>">
        
        <%--CDN fonts/google --%>
        <link href="<c:url value="https://fonts.googleapis.com/css?family=Courier+Prime&display=swap"/>" rel="stylesheet"> 
        <%--CSS and bootrstrap_ files--%>
        
      	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
    	<link rel="stylesheet" href="./css/myStyles.css">
    	
        <%--js_files links with JSLT--%>
		<script src="<c:url value="./js/index.js"/>" type="text/javascript"></script>
   		<script src="<c:url value="https://code.jquery.com/jquery-3.4.1.slim.js"/>" ></script>
    </head>
    <body>
    
    <%--banner --%>
    <div class="mybgcolor text-center col-md-12">
   		<img class="mr-3 mt-3 mb-3" height="140" width="180" src="./img/cinema_logo.png">
   		<h1 class="display-1 mb-2"><b>CinemaDor</b></h1>
    </div>
   <%--Navigation --%>
   
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="navbarResponsive">
    <div class="">
        <ul class="navbar-nav">
            <a class="nav-link nav-item active" href="./index.jsp">Inici</a>
            <a class="nav-link nav-item" href="filtrado.jsp?genere=FICCIO">Ciència ficció</a>
            <a class="nav-link nav-item" href="filtrado.jsp?genere=AVENTURES">Aventures</a>
            <a class="nav-link nav-item" href="filtrado.jsp?genere=TERROR">Terror</a>
            <a class="nav-link nav-item" href="filtrado.jsp?genere=DIBUIXOS">Dibuixos</a>
                    	
          	<%--Login Section --%>
        <c:if test = "${usuari==null}">
	        <div>
	        	<a class="nav-link nav-item" href="login/user-login.jsp">Login</a>
	        </div>
        </c:if>
        <c:if test = "${usuari!=null}">
	        <div style="text-align:right">
	        	<c:out value="${usuari.nom}"/>
	        </div>
        </c:if>
          <form action="./llista-films.jsp" class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" name="search" id="search" type="search" placeholder="Introduce a title">
					<button class="btn btn-warning my-2 my-sm-0" type="submit">Search</button>
				</form>
        </ul>
      </div>
  </nav>
    