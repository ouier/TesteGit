package sp.rafael.simplerest.rest;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;

import sp.rafael.simplerest.model.to.Pessoa;

@Path("/pessoas")
@Stateless
public class PessoaEndpoint {
	
	
	private List<Pessoa> pessoas;
	
	@GET
	@Produces(value = { "application/json;charset=utf-8" })
	public List<Pessoa> getPessoas(){
		return pessoas;
	}
	
	@POST
	@Consumes("application/json")
	public Response postPessoa(Pessoa pessoa){
		if(pessoas==null){
			pessoas = new ArrayList<Pessoa>();
		}
		pessoas.add(pessoa);
		return Response.created(UriBuilder.fromResource(PessoaEndpoint.class).path(String.valueOf(pessoa.getId())).build()).build();
	}
	
	
	@PostConstruct
	public void setLista(){
		pessoas = new ArrayList<Pessoa>();
		Pessoa p = new Pessoa();
		p.setId(1);
		p.setNome("Rafael");
		p.setIdade(31);
		pessoas.add(p);
		
		p = new Pessoa();
		p.setId(2);
		p.setNome("Keyla");
		p.setIdade(31);
		pessoas.add(p);
	}

}
