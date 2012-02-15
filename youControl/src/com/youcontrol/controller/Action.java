package com.youcontrol.controller;

public enum Action {

	ADD("Criar"), EDIT("Editar");
	
	private String label;
	
	private Action(String label) {
		this.label = label;
	}

	public String getLabel() {
		return this.label;
	}
	
}
