<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String nomWeb = "CinemaDor";       
    int anysAniversari = 30;
    LocalDate dataFundacio = LocalDate.of(1986, 3, 11);
    //Coordenades localització
    float x = 167.23f;
    float y = 168.23f;   
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cinema</title>
    </head>
    <body>
        <h1><%=nomWeb %></h1>
        <c:set var="avui" value="<%=new java.util.Date()%>" />
        <p>Avui:<c:out value="${avui}"/></p>