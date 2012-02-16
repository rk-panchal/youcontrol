package com.youcontrol.model;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class EntityObject implements Serializable{

	
	private Long id;
	
	@Id 
	@GeneratedValue
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	@Override
	public int hashCode() {
		return this.id.hashCode();
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof EntityObject){
			EntityObject toCompare = (EntityObject) obj;
			return toCompare.id.equals(this.id);
		}
		return false;
	}
}
