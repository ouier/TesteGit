package br.org.sistemafieg.ffr.modelo.vo;

import java.io.Serializable;
import java.util.List;

public class Rows implements Serializable{
	private List<Row> rows;

	public List<Row> getRows() {
		return rows;
	}

	public void setRows(List<Row> rows) {
		this.rows = rows;
	} 
}
