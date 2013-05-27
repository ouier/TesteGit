package br.org.sistemafieg.hello.modelo.persistencia;

import java.io.Serializable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


public class DAO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@PersistenceContext(unitName="hello")
	private transient EntityManager entityManager;

	public EntityManager getEntityManager() {
		return entityManager;
	}
	
	
	
}
