package com.cinema.dto;

import com.mysql.cj.Session;
import com.cinema.dto.Director;

import java.util.List;
import java.util.ArrayList;
import java.io.Serializable;

public class Film implements Serializable {
	private static final long serialVersionUID = 6116144376715379942L;
	
	private Integer id;
    private String nom;
    private String sinopsis;
    private String caratula; 
    private Genere genere; 
    private String edatRec;
    private  List<Sessions> horari = new ArrayList<>();
    private String dataEstreno;
    private Boolean estreno = false;
    private String duration;
    private Director director;
    
    public Film(Integer id) {
		this.id = id;
	}

	public Film(Integer id, String nom, String sinopsis, String caratula, Genere genere, String edatRec,List<Sessions> horari,
			String dataEstreno, Boolean estreno, String duration,  Director director) {
		
		super();
		this.id = id;
		this.nom = nom;
		this.sinopsis = sinopsis;
		this.caratula = caratula;
		this.genere = genere;
		this.edatRec = edatRec;
		this.horari = horari;
		this.dataEstreno = dataEstreno;
		this.estreno = estreno;
		this.duration = duration;
		this.director = director;

	}
	
	
	
	public Film(Integer id, String nom, String sinopsis, String caratula, Genere genere, String edatRec,
			String dataEstreno, Boolean estreno, String duration) {
		
		super();
		this.id = id;
		this.nom = nom;
		this.sinopsis = sinopsis;
		this.caratula = caratula;
		this.genere = genere;
		this.edatRec = edatRec;
		this.dataEstreno = dataEstreno;
		this.estreno = estreno;
		this.duration = duration;

	}
	
	
	public Boolean getEstreno() {
        return estreno;
    }

    public void setEstreno(Boolean estreno) {
        this.estreno = estreno;
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getSinopsis() {
        return sinopsis;
    }
    
    public Genere getGenere() {
        return genere;
    }

    public void setGenere(Genere genere) {
        this.genere = genere;
    }
    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }

    public List<Sessions> getHorari() {
        return horari;
    }

    public void setHorari(List<Sessions> horari) {
        this.horari = horari;
    }

    public String getDataEstreno() {
        return dataEstreno;
    }

    public Director getDirector() {
		return director;
	}

	public void setDirector(Director director) {
		this.director = director;
	}

	public void setDataEstreno(String dataEstreno) {
        this.dataEstreno = dataEstreno;
    }
    
    public String getEdatRec() {
        return edatRec;
    }

    public void setEdatRec(String edatRec) {
        this.edatRec = edatRec;
    }
    
    public String getCaratula() {
        return caratula;
    }

    public void setCaratula(String caratula) {
        this.caratula = caratula;
    }    
    
    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }
    
	/*
	 * public Director getDirector() { return director; }
	 * 
	 * public void setDirector(Director director) { this.director = director; }
	 */

	@Override
	public String toString() {
		return "Film [id=" + id + ", nom=" + nom + ", sinopsis=" + sinopsis + ", caratula=" + caratula + ", genere="
				+ genere + ", edatRec=" + edatRec + ", horari=" + horari + ", dataEstreno=" + dataEstreno + ", estreno="
				+ estreno + ", duration=" + duration + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Film other = (Film) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
    
}
