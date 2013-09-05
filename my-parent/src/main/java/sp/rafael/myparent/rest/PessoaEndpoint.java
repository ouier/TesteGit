package sp.rafael.myparent.rest;

import java.util.List;

import javax.ejb.Stateful;
import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.core.UriBuilder;

import sp.rafael.myparent.login.Login;
import sp.rafael.myparent.model.to.Pessoa;

/**
 * 
 */
@Stateful
@Path("/pessoas")
@SessionScoped
public class PessoaEndpoint {
	
	@PersistenceContext(unitName = "forge-default")
	private EntityManager em;

	@Inject 
	private Login pessoa;
	
	@GET
	@Path("/teste")
	@Produces(MediaType.APPLICATION_JSON)
	public String teste(){
		System.out.println(pessoa);
		if(pessoa!=null && pessoa.getPessoaLogada()!=null){
			System.out.println(pessoa.getPessoaLogada());
			return "Pessoa logada";
		}else{
			return "Sem dados de login";
		}
	}

	
	@POST
	@Consumes("application/json")
	public Response create(Pessoa entity) {
		em.persist(entity);
		return Response.created(
				UriBuilder.fromResource(PessoaEndpoint.class)
						.path(String.valueOf(entity.getId())).build()).build();
	}

	@DELETE
	@Path("/{id:[0-9][0-9]*}")
	public Response deleteById(@PathParam("id") Long id) {
		Pessoa entity = em.find(Pessoa.class, id);
		if (entity == null) {
			return Response.status(Status.NOT_FOUND).build();
		}
		em.remove(entity);
		return Response.noContent().build();
	}

	@GET
	@Path("/{id:[0-9][0-9]*}")
	@Produces("application/json")
	public Response findById(@PathParam("id") Long id) {
		TypedQuery<Pessoa> findByIdQuery = em.createQuery(
				"SELECT p FROM Pessoa p WHERE p.id = :entityId", Pessoa.class);
		findByIdQuery.setParameter("entityId", id);
		Pessoa entity;
		try {
			entity = findByIdQuery.getSingleResult();
		} catch (NoResultException e) {
			entity = new Pessoa();
		}
		if (entity == null) {
			return Response.status(Status.NO_CONTENT ).build();
		}
		return Response.ok(entity).build();
	}

	@GET
	@Produces("application/json")
	public List<Pessoa> listAll() {
		final List<Pessoa> results = em.createQuery("SELECT p FROM Pessoa p",
				Pessoa.class).getResultList();
		return results;
	}

	@PUT
	@Path("/{id:[0-9][0-9]*}")
	@Consumes("application/json")
	public Response update(@PathParam("id") Long id, Pessoa entity) {
		entity.setId(id);
		entity = em.merge(entity);
		return Response.noContent().build();
	}
}