package br.org.sistemafieg.seam3cdi.modelo.persistencia;

import java.io.Serializable;

import javax.inject.Inject;
import javax.persistence.EntityManager;

public class GenericPersistencia implements Serializable{

	@Inject
	private EntityManager entityManager;

	public EntityManager getEntityManager() {
		return entityManager;
	}
	
}
