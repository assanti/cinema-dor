   
<%@ page import="com.cinema.dto.User" %> 
   
<%@include file="../header.jsp"%>

<%
	User usu = (User)session.getAttribute("user");
	System.out.println(usu);
%>
	<h1 class="text-center mt-4">Benvingut</h1><c:out value="${usu.getUserName()}"/>
	<div class="text-center mt-4">
		<a href="../index.jsp" class="btn btn-primary">Continua</a>
	</div>

