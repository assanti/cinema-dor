package com.cinema.dto;

public class Sessions {
	
	private int id;
	private String dataInici;
	private String dataFinal;
	
	public Sessions(int id) {
		super();
		this.id = id;
	}

	public Sessions(int id, String dataInici, String dataFinal) {
		super();
		this.id = id;
		this.dataInici = dataInici;
		this.dataFinal = dataFinal;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDataInici() {
		return dataInici;
	}

	public void setDataInici(String dataInici) {
		this.dataInici = dataInici;
	}

	public String getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(String dataFinal) {
		this.dataFinal = dataFinal;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
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
		Sessions other = (Sessions) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Sessions [id=" + id + ", dataInici=" + dataInici + ", dataFinal=" + dataFinal + "]";
	}
	
	
	
	
	

}
