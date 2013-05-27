package br.org.sistemafieg.hello.modelo.persistencia;

import javax.annotation.PostConstruct;
import javax.enterprise.inject.Produces;
import javax.inject.Inject;
import javax.inject.Singleton;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactory;

public class RepositoryProducer {

	@Inject
	DAO dao;
	
	public Object createRepository(Class clazz){
		JpaRepositoryFactory rf = new JpaRepositoryFactory(dao.getEntityManager());
		return rf.getRepository(clazz);
	} 
	
}
