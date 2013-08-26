package br.org.sistemafieg.ffr.modelo.vo;

import java.io.Serializable;
import java.util.List;

public class Row implements Serializable{
	
	private List<String> data;
	private long id;

	public List<String> getData() {
		return data;
	}

	public void setData(List<String> data) {
		this.data = data;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
}
