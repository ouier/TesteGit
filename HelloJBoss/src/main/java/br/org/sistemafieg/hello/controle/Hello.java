package br.org.sistemafieg.hello.controle;

import java.util.List;

import javax.enterprise.inject.Model;
import javax.inject.Inject;

import br.org.sistemafieg.hello.modelo.negocio.PessoaNegocio;
import br.org.sistemafieg.hello.modelo.to.Pessoa;

@Model
public class Hello {
	
	@Inject
	PessoaNegocio neg;
	
	public String getHello(){
		return "Hello class!";
	}
	
	public List<Pessoa> getListaPessoas(){
		return neg.listarPessoas();
	}

}
