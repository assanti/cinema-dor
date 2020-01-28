<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.daw.cinema.Film"%>
<%@ page errorPage="mostra_error.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 <%-- S'inclou dades  --%>
<%@include file="dades.jsp" %>
<%
    // Recuperam el codi de la pel·lícula
    Integer codiFilm = Integer.parseInt(request.getParameter("codi"));
    System.out.println("Codi film:"+codiFilm);
    
    //Comprovam si es troba a la 
    boolean trobada = false;
    if (llistaFilms.containsKey(codiFilm)){
        // Recuperam els objecte pel·lícula amb totes les dades
        Film pelicula = llistaFilms.get(codiFilm);
        // Necessari per ser processat per JSLT
        request.setAttribute("pelicula", pelicula);
        trobada = true;
    }
    
    request.setAttribute("exist", trobada);

 %>
<%-- capçalera --%>
<jsp:include page="header.jsp" />
<c:if test = "${exist}">    
    <%-- Presentació de les dades de la pel·lícula --%>
    <ul>
        <li>Nom:<c:out value="${pelicula.nom}"/></li>
        <li>Sinopsis:<c:out value="${pelicula.sinopsis}"/></li>
        <li>Genere:<c:out value="${pelicula.genere}"/></li>
        <li>Caratula:<c:out value="${pelicula.caratula}"/></li>        
        <li>Estreno:<c:out value="${pelicula.estreno}"/></li>
       
        <%-- Transformació de LocaleData a Date i després al format català --%>
        <fmt:parseDate value="${pelicula.dataEstreno}" pattern="yyyy-MM-dd" var="dataEstrenoParse" type="date" />
        <fmt:formatDate value="${dataEstrenoParse}" var="data_estreno" pattern="dd-MM-yyyy"/>
        
        <%-- Missatge segons si és pel·licula d'estrena --%>
        <c:if test = "${pelicula.estreno}">
            <p>Data estrena:<c:out value="${data_estreno==null ?'Proximament':data_estreno}" /> <p>
        </c:if> 
        
        <%-- Missatge segons l'edat recomanada --%>
        <c:choose>
            <c:when test="${pelicula.edatRec eq 18}">
                <c:out value="${'<li>Edat recomanora a partir de 18'}" escapeXml="false" />
                <c:out value="${'<li>Conté contigut que pot especialment sensible</li>'}" escapeXml="false"/>
            </c:when>
            <c:when test="${pelicula.edatRec eq 16}">
                <c:out value="${'<li>Edat recomanora a partir de 18'}" escapeXml="false" />
                <c:out value="${'<li>Edat recomanora a partir de 16. Pot contenir escenes i vocabulari violent</li>'}" escapeXml="false"/>
            </c:when>
            <c:otherwise>
                <c:out value="${'<li>Edat recomanora a partir de 18'}" escapeXml="false" />
                <c:out value="${'<li>Tots els públicos. Divertida per tota la família</li>'}" escapeXml="false"/>
            </c:otherwise>
        </c:choose>
        
        <%-- Es mostra horari del cinema si no hi es d'estreno o si la data d'avui és igual que l'actual --%>
        <fmt:formatDate value="${now}" var="avui" pattern="dd-MM-yyyy"/>        
        <c:if test = "${!pelicula.estreno || (data_estreno eq avui)}">
            <p>
                <c:forEach var="hora" varStatus="loop" items="${pelicula.horari}">  
                     <c:out value="${hora.value}"/>
                     <%-- Dibuix de n "," --%>
                     <c:if test = "${loop.index < (pelicula.horari.size()-1)}">,</c:if>
                </c:forEach>
            </p>
        </c:if>
            
    </ul>
</c:if>

<%-- Missatge d'avís controlat si no s'ha de trobat cap pel·licula amb el codi especificat --%>
<c:if test = "${!exist}">
    <jsp:forward page = "codi_incorrecte.jsp" />     
</c:if>
<%-- Inclou el resultat de la URL --%>
<jsp:include page="footer.jsp" />
                   

