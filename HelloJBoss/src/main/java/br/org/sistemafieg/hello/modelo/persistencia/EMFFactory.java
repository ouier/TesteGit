package br.org.sistemafieg.hello.modelo.persistencia;

import javax.enterprise.context.RequestScoped;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EMFFactory {

	@Produces @RequestScoped
	public EntityManagerFactory createFactory(){
		return Persistence.createEntityManagerFactory("hello");
	}
	
	public void close(@Disposes EntityManagerFactory emf){
		emf.close();
	}
	
}
