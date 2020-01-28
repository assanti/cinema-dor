<%@ page import="java.util.Iterator"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.cinema.dto.Film"%>
<%@ page errorPage="error/error-page.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.cinema.db.FilmBDService"%>

<%--  Aquesta pàgina mostrarà la llista de pel·lícules des de la base de dades --%>
<%
	FilmBDService serveiFilm = new FilmBDService();
	String genere = request.getParameter("genere");
	String searchInput = request.getParameter("search");
	List<Film> llistaFilms = new ArrayList<>();

	if (genere != null) {
		llistaFilms = serveiFilm.getListFilmsInsegura(genere);
		request.setAttribute("llistaFilms", llistaFilms);
	} else {
		if (searchInput == null) {
			llistaFilms = serveiFilm.getListFilmsNoGen();
			request.setAttribute("llistaFilms", llistaFilms);
		} else {

			List<Film> listBySearch = serveiFilm.getListFilmsBySearch(searchInput);
			request.setAttribute("listBySearch", listBySearch);
		}
	}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="header.jsp"%>


<div class="row d-flex justify-content-center col-md-12">

	<c:choose>

		<c:when test="${listBySearch != null}">
			<c:forEach var="film" varStatus="loop" items="${listBySearch}">
				<div class="card col-md-3 mt-4 ml-3 mr-3">
					<img class="mt-3 card-img-top img-rounded" src="${film.caratula}"
						alt="">
					<div class="card-body">
						<h4 class="card-title">
							<a href='detall_film.jsp?codi=<c:out value="${film.id}"/>'> <c:out
									value="${film.nom}" />
							</a>
						</h4>
						<p class="card-text">${film.sinopsis}</p>
						<p class="card-text">Edat recomenada: ${film.edatRec}</p>
					</div>
					<div class="card-footer">
						<a href="detall_film.jsp?codi=${film.id}" class="btn btn-primary">Més
							informació</a>
					</div>
				</div>
			</c:forEach>
		</c:when>

		<c:otherwise>
			<c:forEach var="film" varStatus="loop" items="${llistaFilms}">
				<div class="card col-md-3 mt-4 ml-3 mr-3">
					<img class="mt-3 card-img-top img-rounded" src="${film.caratula}"
						alt="">
					<div class="card-body">
						<h4 class="card-title">
							<a href='detall_film.jsp?codi=<c:out value="${film.id}"/>'> <c:out
									value="${film.nom}" />
							</a>
						</h4>
						<p class="card-text">${film.sinopsis}</p>
						<p class="card-text">Edat recomenada: ${film.edatRec}</p>
					</div>
					<div class="card-footer">
						<a href="detall_film.jsp?codi=${film.id}" class="btn btn-primary">Més
							informació</a>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>

	</c:choose>



</div>


<%@include file="footer.jsp"%>