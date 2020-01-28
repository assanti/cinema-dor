<%@ page import="java.util.Iterator"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.daw.cinema.Film"%>
<%@ page errorPage="mostra_error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="dades.jsp" %>
<%-- Bloc de declaracions de variables i mètodes --%>
<%!
    
    private enum genere { FICCIO, AVENTURES, TERROR, DIBUIXOS };
    //private static final int NUM_FILM = 5;// màxim de pel·lícules a mostrar

    // Mètode per filtrar per genere
    private Map<Integer, Film> getFilmsPerGenere(String genere, Map<Integer, Film> llista) {
        if (genere==null){
            return llista; //Tornam totes els films.
        }else{
            Map films = new HashMap();        
            for (Map.Entry<Integer, Film> entry : llista.entrySet()) {
                if (genere.equals(entry.getValue().getGenere()))
                    films.put(entry.getKey(), entry.getValue());            
            }
            return films;
        }
    }


/*
Alternativas d'iterator
//expressió lamda: datos.forEach((k,v) -> System.out.println("Key: " + k + ": Value: " + v));

        for (Key k : llistaFilm.keySet()) {
            films.put(k, playerCooldowns.get(k) - 20);
        }

        Iterator it = llistaFilm.keySet().iterator();
        while(it.hasNext()){
          Integer key = (Integer)it.next();
          if (genere.equals(llistaFilm.get(key).getGenere()))
                films.put(key, llistaFilm.get(key));
        }
*/

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
    <%-- Enllaços cagegories/genere--%>
    <ul>
         <a href="llista_films.jsp?genere=FICCIO">Ciència ficció</a> |
         <a href="llista_films.jsp?genere=AVENTURES">Aventures</a> |
         <a href="llista_films.jsp?genere=TERROR">Terror</a> |
         <a href="llista_films.jsp?genere=DIBUIXOS">Dibuixos</a> |
    </ul>
    
    <%-- Mostrar llista pel·lícules per gènere --%>
    <ul>
        <%           
            String pGenere = request.getParameter("genere");
            System.out.println("genere:"+pGenere);
            Map<Integer, Film> llistaFilmsFiltrada= getFilmsPerGenere(pGenere, llistaFilms);
            request.setAttribute("llistaFilmsFiltrada", llistaFilmsFiltrada);            
        %>
        <%-- Mostrar màxim les pel·lícules de NUM_FILM --%>
        <c:set var="NUM_FILM" value="5" scope="page" />
        <c:forEach var="film" varStatus="loop" items="${llistaFilmsFiltrada}">
            <c:if test = "${loop.index < NUM_FILM}">
            <li><a href="detall_film.jsp?codi=<c:out value="${film.key}"/>">
                    <c:out value="${film.value.nom}"/>
                </a>
            </li>
            </c:if>
        </c:forEach>
            
    </ul>
<%@include file="footer.jsp" %>