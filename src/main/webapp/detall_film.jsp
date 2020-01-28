<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.cinema.dto.Sessions"%>
<%@ page import="com.cinema.dto.Film"%>
<%@ page import="com.cinema.dto.Director"%>
<%@ page errorPage="error/error-page.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="com.cinema.db.FilmBDService"%>
<%
	// Recuperam el codi de la pel·lícula
	
	Integer codiFilm = Integer.parseInt(request.getParameter("codi"));
	System.out.println("Codi film:" + codiFilm);

	HashMap<Integer, Film> llista_map_films = new HashMap<Integer, Film>();
	FilmBDService filmService = new FilmBDService();
	List<Film> llista_films = filmService.getListFilmsNoGen();
	int counter = 0;
	
	for (Film f : llista_films) {
		counter++;
		llista_map_films.put(counter, f);
	}
	
	//Comprovam si es troba a la  film y sube a request el objecto film y sessions
	
	boolean trobada = false;
	if (llista_map_films.containsKey(codiFilm)) {
		// Recuperam els objecte pel·lícula amb totes les dades
		Film pelicula = llista_map_films.get(codiFilm);
		// Necessari per ser processat per JSLT
		List<Sessions> sess_list = pelicula.getHorari();
		Director dire = pelicula.getDirector();
		String dire_st = dire.getFirstName() + " " + dire.getLastName() ; 
		request.setAttribute("pelicula", pelicula);
		request.setAttribute("sessions", sess_list);
		request.setAttribute("director", dire_st);
		
		trobada = true;
	}
	request.setAttribute("exist", trobada);
	
%>
<%-- capçalera --%>
<jsp:include page="header.jsp" />

<c:if test="${exist}">

	<div class="container my-4">
		<div class="card mb-3 ">
		<div class="row no-gutters">
		<div class="col-md-4">
						<img src="${pelicula.caratula}" class="card-img" alt="..." >
					</div>
					<div class="col-md-8">
					<div class="card-body">
							<h1 class="card-title"><b><c:out value="${pelicula.nom}"/></b></h1>
							<div class="card-text">

								<dl class="row">
									<dt class="col-sm-3">Sinopsis</dt>
									<dd class="col-sm-9"><c:out value="${pelicula.sinopsis}"/></dd>

									<dt class="col-sm-3">Gènere</dt>
									<dd class="col-sm-9">
										<c:out value="${pelicula.genere}"/>
									</dd>

									<dt class="col-sm-3">Estrena</dt>
									<dd class="col-sm-9"><c:out value="${pelicula.estreno?'Sí':'No'}"/></dd>
									
									 <%-- Transformació de LocaleData a Date i després al format català --%>
									<fmt:parseDate value="${pelicula.dataEstreno}" pattern="yyyy" var="dataEstrenoParse" type="date" />
									<fmt:formatDate value="${dataEstrenoParse}" var="data_estreno" pattern="yyyy"/>
									<dt class="col-sm-3">Release</dt>
									<dd class="col-sm-9"><c:out value="${data_estreno}"/></dd>

									<dt class="col-sm-3 text-truncate">Edat recomanada:</dt>
									<dd class="col-sm-9"><img src="img/age-tp.png" style="width:20px"/>
								        
								        <%-- Missatge segons l'edat recomanada --%>
								        <c:choose>
								            <c:when test="${pelicula.edatRec eq '18'}">
								                <c:out value="${'Edat recomanora a partir de 18'}" escapeXml="false" />
								                <c:out value="${'<p>Conté contigut que pot ser especialment sensible<p>'}" escapeXml="false"/>
								            </c:when>
								            <c:when test="${pelicula.edatRec eq '16'}">
								                <c:out value="${'Edat recomanora a partir de 16. <br>(Pot contenir escenes i vocabulari violent)'}" escapeXml="false"/>
								            </c:when>
								            <c:otherwise>
								                <c:out value="${'Tots els públics. Divertida per tota la familia'}" escapeXml="false"/>
								            </c:otherwise>
								        </c:choose>
															
									</dd>

									<dt class="col-sm-3 text-truncate">Horari</dt>
									<dd class="col-sm-9">
									
								       <%-- Es mostra horari del cinema --%> 
							           <c:forEach var="session" varStatus="loop" items="${sessions}">  
							              <span class="badge badge-info"> <c:out value="${session.dataInici}"/> </span>
							           </c:forEach>
							           
									</dd>
									<dt class="col-sm-3 text-truncate">Director</dt>
									<dd class="col-sm-9">
								       <c:out value="${director}"/>
									</dd>
								</dl>
								<div class="container text-center">
									<button type="button" class="btn btn-warning" name="button" ><a href="/cinema/index.jsp">Torna</a></button>
								</div>
							</div>
							<p class="card-text"><small class="text-muted">Descompte del 10% per menors de 8 anys</small></p>
						</div>
						</div>
			</div>
		</div>
		
</c:if>

<jsp:include page="footer.jsp" />

<%-- Missatge d'avís controlat si no s'ha trobat cap pel·lícula amb el codi especificat --%>
<c:if test = "${!exist}">
    <jsp:forward page = "codi_incorrecte.jsp" />     
</c:if>
						




