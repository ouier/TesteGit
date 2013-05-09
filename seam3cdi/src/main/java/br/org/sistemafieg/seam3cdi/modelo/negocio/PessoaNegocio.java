package br.org.sistemafieg.seam3cdi.modelo.negocio;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.org.sistemafieg.seam3cdi.modelo.persistencia.GenericPersistencia;
import br.org.sistemafieg.seam3cdi.modelo.to.Pessoa;

public class PessoaNegocio implements Serializable{
	
	@Inject
	private GenericPersistencia persistencia;
	
	public List<Pessoa> listarPessoas(){
		System.out.println(persistencia.getEntityManager());
		List<Pessoa> lista = persistencia.getEntityManager().createQuery("select p from Pessoa p").getResultList();
		return lista;
	}

}
