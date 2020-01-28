<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.daw.cinema.Film"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
        
    /* Dades simples amb objectes predefinits per java
    Map<Integer, String> llistaFilms = new HashMap();
    llistaFilms.put(1, "Cronicas de narnia");
    llistaFilms.put(2, "Rey leon");
    llistaFilms.put(3, "Ripley");
    llistaFilms.put(3, "Piratas del caribe");
    */
    
    // Dades de pel·lícules
    Map<Integer, Film> llistaFilms = new HashMap();
    llistaFilms.put(1, new Film(1, "Crónicas de narnia", "pelicula de terror oooo", "image.jpg", "F", LocalDate.of(2017, 03, 1)));
    llistaFilms.put(2, new Film(2, "Rey León", "pelicula de terror oooo", "image.jpg", "F",LocalDate.of(2017, 03, 1)));
    llistaFilms.put(3, new Film(3, "Marvel supereroes", "pelicula de terror oooo", "image.jpg", "F",LocalDate.of(2017, 03, 1)));
    llistaFilms.put(4, new Film(4, "Marvel supereroesd", "pelicula de terror oooo", "image.jpg", "F",LocalDate.of(2017, 03, 1)));
    

    // Pelis actuals
    Film peli_5 = new Film(5, "Crónicas de narnia 2", "pelicula de terror oooo", "image.jpg", "F",LocalDate.of(2017, 03, 1));
    HashMap<Integer, String> horari_peli_5 = new HashMap();
    // sessió i horari
    horari_peli_5.put(1, "18.50");
    horari_peli_5.put(2, "19.50");
    horari_peli_5.put(3, "22.50");
    peli_5.setHorari(horari_peli_5);
    llistaFilms.put(5, peli_5);

   
    Film peli_6 = new Film(6, "Massa", "pelicula de terror oooo", "image.jpg", "F",LocalDate.of(2017, 03, 1));
    HashMap<Integer, String> horari_peli_6 = new HashMap();
    // sessió i horari
    horari_peli_6.put(1, "18.50");
    horari_peli_6.put(2, "19.50");
    horari_peli_6.put(3, "22.50");
    peli_6.setHorari(horari_peli_6);
    llistaFilms.put(6, peli_6);

    Film peli_7 = new Film(7, "Terminator 3", "pelicula de terror oooo", "image.jpg", "F", LocalDate.of(2017, 03, 1));
    HashMap<Integer, String> horari_peli_7 = new HashMap();
    // sessió i horari
    horari_peli_7.put(1, "18.50");
    horari_peli_7.put(2, "19.50");
    horari_peli_7.put(3, "22.50");
    peli_7.setHorari(horari_peli_7);
    llistaFilms.put(7, peli_7);

    Film peli_8 = new Film(8, "Los vegadores", "pelicula de terror oooo", "image.jpg", "F", LocalDate.of(2017, 03, 1));
    HashMap<Integer, String> horari_peli_8 = new HashMap();
    // sessió i horari
    horari_peli_8.put(1, "18.50");
    horari_peli_8.put(2, "19.50");
    horari_peli_8.put(3, "22.50");
    peli_8.setHorari(horari_peli_8);
    llistaFilms.put(8, peli_8);     

    // Necessai per ser proceddat per JSLT
    request.setAttribute("llistaFilms", llistaFilms);
%>
