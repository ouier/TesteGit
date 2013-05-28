package br.org.sistemafieg.hello.modelo.negocio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import br.org.sistemafieg.hello.modelo.persistencia.DAO;
import br.org.sistemafieg.hello.modelo.persistencia.PessoaRepository;
import br.org.sistemafieg.hello.modelo.persistencia.RepositoryProducer;
import br.org.sistemafieg.hello.modelo.to.Pessoa;

public class PessoaNegocio implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Inject
	DAO dao;
	
	@Inject
	RepositoryProducer repositoryProducer;
	
	PessoaRepository pessoaRepositorio;
	
	
	@PostConstruct
	public void init(){
		//pessoaRepositorio = (PessoaRepository) repositoryProducer.createRepository(PessoaRepository.class);
	}
	
	
	public List<Pessoa> listarPessoas(){
		List<Pessoa> lista =(List<Pessoa>) dao.getEntityManager().createQuery("select p from Pessoa p").getResultList();
		//List<Pessoa> lista = pessoaRepositorio.findAll();
		if(lista==null)
			lista = new ArrayList<Pessoa>();
		System.err.print("==================LISTA DE PESSOAS===================");
		return lista;
	}
	
	

}
