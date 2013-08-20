package br.org.sistemafieg.ffr.rest;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
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
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.core.UriBuilder;

import br.org.sistemafieg.ffr.modelo.vo.Pessoa;

/**
 * 
 */
@Stateless
@Path("/pessoas")
public class PessoaEndpoint
{
   @PersistenceContext(unitName = "forge-default")
   private EntityManager em;

   @POST
   @Consumes("application/json")
   public Response create(Pessoa entity)
   {
	  if(!em.contains(entity))
		  entity = em.merge(entity);
      em.persist(entity);
      em.flush();
      return Response.created(UriBuilder.fromResource(PessoaEndpoint.class).path(String.valueOf(entity.getId())).build()).build();
   }

   @DELETE
   @Path("/{id:[0-9][0-9]*}")
   public Response deleteById(@PathParam("id") Long id)
   {
      Pessoa entity = em.find(Pessoa.class, id);
      if (entity == null)
      {
         return Response.status(Status.NOT_FOUND).build();
      }
      em.remove(entity);
      return Response.noContent().build();
   }

   @GET
   @Path("/{id:[0-9][0-9]*}")
   @Produces("application/json")
   public Response findById(@PathParam("id") Long id)
   {
      TypedQuery<Pessoa> findByIdQuery = em.createQuery("SELECT p FROM Pessoa p LEFT JOIN FETCH p.enderecos WHERE p.id = :entityId", Pessoa.class);
      findByIdQuery.setParameter("entityId", id);
      Pessoa entity = findByIdQuery.getSingleResult();
      if (entity == null)
      {
         return Response.status(Status.NOT_FOUND).build();
      }
      return Response.ok(entity).build();
   }

   @GET
   @Produces("application/json")
   public List<Pessoa> listAll()
   {
      final List<Pessoa> results = em.createQuery("SELECT p FROM Pessoa p LEFT JOIN FETCH p.enderecos", Pessoa.class).getResultList();
      return results;
   }

   @PUT
   @Path("/{id:[0-9][0-9]*}")
   @Consumes("application/json")
   public Response update(@PathParam("id") Long id, Pessoa entity)
   {
      entity.setId(id);
      entity = em.merge(entity);
      return Response.noContent().build();
   }
   
   @PostConstruct
   public void criarPessoas(){
	   Pessoa p = new Pessoa();
	   p.setId(1L);
	   p.setNome("Rafael Pereira");
	   create(p);
	   
	   p = new Pessoa();
	   p.setId(2L);
	   p.setNome("Keyla Pereira");
	   create(p);
	   
	    p = new Pessoa();
	   p.setId(3L);
	   p.setNome("Maria Pereira");
	   create(p);
	   
	   p = new Pessoa();
	   p.setId(4L);
	   p.setNome("Joaquim Pereira");
	   create(p);
	   
	   p = new Pessoa();
	   p.setId(5L);
	   p.setNome("Paulo Henrique Pereira");
	   create(p); 
   }
}