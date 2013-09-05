package sp.rafael.myparent.rest;

import javax.ejb.Stateful;
import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import sp.rafael.myparent.login.Login;
import sp.rafael.myparent.login.TesteScopo;
import sp.rafael.myparent.model.to.Pessoa;

@SessionScoped
@Stateful
@Path("/auth")
public class LoginEndpoint {

	@Inject
	private Login login;
	
	@Inject TesteScopo testeScopo;
	
	@GET
	@Path("/login")
	@Produces(MediaType.APPLICATION_JSON)
	public String fazerLogin(){
		Pessoa pessoaLogada = new Pessoa();
		pessoaLogada.setNome("Rafael Pereira");
		pessoaLogada.setId(1L);
		pessoaLogada.setNomeMae("MARIA DE SOUZA PEREIRA");
		pessoaLogada.setNomePai("JOAQUIM PEREIRA");
		login.setPessoaLogada(pessoaLogada);
		System.out.println("LOGINENDPOINT=>"+login);
		System.out.println(testeScopo);
		return "fez login";
	}
	
	@GET
	@Path("/logout")
	@Produces(MediaType.APPLICATION_JSON)
	public String fazerLogout(){
		login.setPessoaLogada(null);
		return "logout";
	}
	
}
