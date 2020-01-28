package com.cinema.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cinema.dto.Sessions;
import com.cinema.db.BDConnectionMySQL;
import com.cinema.dto.Film;
import com.cinema.dto.Genere;
import com.cinema.dto.Director;


public class FilmBDService {
	
	// LListat de pel·lícules
	
	public List<Film> getListFilmsNoGen() {
        
		BDConnectionMySQL bd = new BDConnectionMySQL();
        List<Film> list = new ArrayList<>();
        try {
        	String query = "select * from film";            
            Connection connexio = bd.getConnection();
            Statement sentencia = connexio.createStatement();
            ResultSet resultat  = sentencia.executeQuery(query);
                  
            if (resultat!=null) {
	            while (resultat.next()) {
	                Integer id = resultat.getInt("flm_id");
	                String title = resultat.getString("flm_title"); 
	                String desc = resultat.getString("flm_synopsis");
	                String cover = resultat.getString("flm_cover");
	                Genere gen = Genere.valueOf(resultat.getString(("flm_genre").toString()).toUpperCase());
	                Integer age_rating = resultat.getInt("flm_age_rating");
	                String age_rating_vr = new String();
	                String duration = resultat.getString("flm_duration");
	                //String director = resultat.getString("director");
	               // Director iDirector = new Director(id, );
	                if(age_rating == 0) {
	                	age_rating_vr = "Para todos los publicos";
	                }else {
	                	age_rating_vr = String.valueOf(age_rating);
	                }
	                String date_release = resultat.getString("flm_date_release");
	                Boolean premiere = resultat.getBoolean("flm_premiere");
	                Director director = this.getDirector(id);
	               	List<Sessions> ses_list = getListSessions(id);
					list.add(new Film( Integer.valueOf(id), title, desc, cover, gen, age_rating_vr, ses_list, date_release, premiere , duration, director));
	            
	            
	            }
            }
            sentencia.close();
            connexio.close();
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
        
    }
	
	//recogemos lista de sessiones
	
	public List<Sessions> getListSessions(int idFilm) {
		
		BDConnectionMySQL bd = new BDConnectionMySQL();
		List<Sessions> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM session WHERE ses_flm_id = ?";  
			Connection connexio = bd.getConnection();
			PreparedStatement sentencia= connexio.prepareStatement(query);
			// Configuram el pàrametre d'entrada
			sentencia.setInt(1, idFilm);

			ResultSet resultat  = sentencia.executeQuery();
			
			if (resultat!=null) {
				while (resultat.next()) {
					int id = resultat.getInt("ses_flm_id");
					String hora_inici = resultat.getString("ses_hour_ini");
					String hora_fi = resultat.getString("ses_hour_end"); 
					Sessions session = new Sessions( id, hora_inici, hora_fi); 
					list.add(session);
					
				}
			}
			sentencia.close();
			connexio.close();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	// Llista filtrada per genere
	
	public List<Film> getListFilmsWithGen(String gen) {
		
		BDConnectionMySQL bd = new BDConnectionMySQL();
		List<Film> list = new ArrayList<>();
		try {
			String query = "select * from film where flm_genre=?";            
			Connection connexio = bd.getConnection();
			PreparedStatement sentencia= connexio.prepareStatement(query);
			
			sentencia.setString(1, gen);
			ResultSet resultat  = sentencia.executeQuery(query);
			
			if (resultat!=null) {
				while (resultat.next()) {
					Integer id = resultat.getInt("flm_id");
	                String title = resultat.getString("flm_title"); 
	                String desc = resultat.getString("flm_synopsis");
	                String cover = resultat.getString("flm_cover");
	                Genere gen1 = Genere.valueOf(gen); 
	                Integer age_rating = resultat.getInt("flm_age_rating");
	                String age_rating_vr = new String();
	                if(age_rating == 0) {
	                	age_rating_vr = "Para todos los publicos";
	                }else {
	                	age_rating_vr = String.valueOf(age_rating);
	                }
	                List<Sessions> ses_list = getListSessions(id);
	                String date_release = resultat.getString("flm_date_release");
	                Boolean premiere = resultat.getBoolean("flm_premiere");
	                String durationdos = resultat.getString("flm_duration");
	                Director director = this.getDirector(id);
					  list.add(new Film( Integer.valueOf(id), title, desc, cover, gen1, age_rating_vr, ses_list, date_release, premiere , durationdos, director));
					
					}
			}
			sentencia.close();
			connexio.close();
			
		} catch (SQLException e) {
			System.out.println("stuard little");
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	// Llista filtrada per genere
	
	public List<Film> getListFilmsInsegura(String gen) {
		
		BDConnectionMySQL bd = new BDConnectionMySQL();
		List<Film> list = new ArrayList<>();
		try {
			String query = "select * from film where flm_genre='"+ gen.toString() +"'";            
			Connection connexio = bd.getConnection();
			Statement sentencia = connexio.createStatement();
			ResultSet resultat  = sentencia.executeQuery(query);
			
			if (resultat!=null) {
				while (resultat.next()) {
					Integer id = resultat.getInt("flm_id");
	                String title = resultat.getString("flm_title"); 
	                String desc = resultat.getString("flm_synopsis");
	                String cover = resultat.getString("flm_cover");
	                String durationtres = resultat.getString("flm_duration");
	                Genere gen2 = Genere.valueOf(resultat.getString(("flm_genre").toString()).toUpperCase());
	                Integer age_rating = resultat.getInt("flm_age_rating");
	                String age_rating_vr = new String();
	                if(age_rating == 0) {
	                	age_rating_vr = "Para todos los publicos";
	                }else {
	                	age_rating_vr = String.valueOf(age_rating);
	                }
	                String date_release = resultat.getString("flm_date_release");
	                Boolean premiere = resultat.getBoolean("flm_premiere");
	                Director director = this.getDirector(id);
	                List<Sessions> ses_list = getListSessions(id);
	                
	                list.add(new Film( Integer.valueOf(id), title, desc, cover, gen2, age_rating_vr, ses_list, date_release, premiere , durationtres, director));
			            
				}
			}
			sentencia.close();
			connexio.close();
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	// Llista filtrada per search input

	public List<Film> getListFilmsBySearch(String title) {

		BDConnectionMySQL bd = new BDConnectionMySQL();
		List<Film> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM film WHERE flm_title LIKE '%" + title +  "%'" + " OR flm_synopsis LIKE '%" + title + "%'";
			//String query = "SELECT * FROM film WHERE flm_title LIKE '%" + "?" + "%'" + " OR flm_synopsis LIKE '%" + "?" + "%'";
			Connection connexio = bd.getConnection();
			PreparedStatement sentencia= connexio.prepareStatement(query);
			// Configuram el pàrametre d'entrada
			//sentencia.setString(1, title); 
			//sentencia.setString(2, title);
			ResultSet resultat = sentencia.executeQuery(query);

			System.out.println(resultat);
			
			if (resultat != null) {
				while (resultat.next()) {
					Integer id = resultat.getInt("flm_id");
					String titletw = resultat.getString("flm_title");
					String desc = resultat.getString("flm_synopsis");
					String cover = resultat.getString("flm_cover");
					String duration = resultat.getString("flm_duration");
					Genere gen2 = Genere.valueOf(resultat.getString(("flm_genre").toString()).toUpperCase());
					Integer age_rating = resultat.getInt("flm_age_rating");
					String age_rating_vr = new String();
					String date_release = resultat.getString("flm_date_release");
					Boolean premiere = resultat.getBoolean("flm_premiere");
					Director director = this.getDirector(id);
					if (age_rating == 0) {
						age_rating_vr = "Para todos los publicos";
					} else {
						age_rating_vr = String.valueOf(age_rating);
					}
					List<Sessions> ses_list = getListSessions(id);
					list.add(new Film(Integer.valueOf(id), title, desc, cover, gen2, age_rating_vr, ses_list,
							date_release, premiere, duration, director));
					//System.out.println(list);
					
				}
			}

			sentencia.close();
			connexio.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	 
	
	public Director getDirector(Integer id) { 
	
		BDConnectionMySQL bd = new BDConnectionMySQL(); 
		Director theDirector = new Director();
		try { 
			
			String query = "select * from director where dire_id =" + id ;            
			Connection connexio = bd.getConnection();
			Statement sentencia = connexio.createStatement();
			ResultSet resultat  = sentencia.executeQuery(query);
			
	  if (resultat!=null) {
	  while(resultat.next()) {
		  int dire_id = resultat.getInt("dire_id"); 
		  String dire_name = resultat.getString("dire_name"); 
		  String dire_surname = resultat.getString("dire_surname");
	  
		  theDirector.setId(dire_id); 
		  theDirector.setFirstName(dire_name);
		  theDirector.setLastName(dire_surname);
		  System.out.println(dire_id + dire_name + dire_surname);
		  
		  
	  	}
	  } 
	  sentencia.close(); 
	  connexio.close();
	  } catch (SQLException e) { 
		  System.out.println(e.getMessage()); 
	  		} 	
		
		return theDirector;
	}
	
	
	
}
