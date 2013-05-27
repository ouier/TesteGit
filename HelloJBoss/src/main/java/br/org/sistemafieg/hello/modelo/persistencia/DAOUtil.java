package br.org.sistemafieg.hello.modelo.persistencia;

import javax.enterprise.context.RequestScoped;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DAOUtil {
	
//	EntityManagerFactory emf = Persistence.createEntityManagerFactory("hello");
	
	@Produces @RequestScoped
	public EntityManager createEntityManager(EntityManagerFactory emf){
		return emf.createEntityManager();
	}
	
	public void close(@Disposes EntityManager em){
		if(em.isOpen())
			em.close();
	}
}
