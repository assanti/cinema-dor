package com.cinema.dto;

public class Director {
	
	private int id; 
	private String firstName;
	private String lastName;
	
	public Director() {
		super();
	}
	
	public Director(int id) {
		super();
		this.id = id;
	}

	public Director(int id, String firstName, String lastName) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firtName) {
		this.firstName = firtName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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
		Director other = (Director) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Director [id=" + id + ", firtName=" + firstName + ", lastName=" + lastName + "]";
	}
	
}