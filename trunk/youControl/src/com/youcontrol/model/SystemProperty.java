package com.youcontrol.model;

import javax.persistence.Entity;

@Entity
public class SystemProperty extends EntityObject{

	String name;
	
	String value;
	
	String description;
	
	public SystemProperty() {
	}

	public SystemProperty(String name, String value) {
		this.name = name;
		this.value = value;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}
