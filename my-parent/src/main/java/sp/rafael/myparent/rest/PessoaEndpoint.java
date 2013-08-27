package sp.rafael.myparent.rest;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.core.UriBuilder;
import sp.rafael.myparent.model.to.Pessoa;

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
   @Consumes("application/xml")
   public Response create(Pessoa entity)
   {
      em.persist(entity);
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
   @Produces("application/xml")
   public Response findById(@PathParam("id") Long id)
   {
      TypedQuery<Pessoa> findByIdQuery = em.createQuery("SELECT p FROM Pessoa p WHERE p.id = :entityId", Pessoa.class);
      findByIdQuery.setParameter("entityId", id);
      Pessoa entity = findByIdQuery.getSingleResult();
      if (entity == null)
      {
         return Response.status(Status.NOT_FOUND).build();
      }
      return Response.ok(entity).build();
   }

   @GET
   @Produces("application/xml")
   public List<Pessoa> listAll()
   {
      final List<Pessoa> results = em.createQuery("SELECT p FROM Pessoa p", Pessoa.class).getResultList();
      return results;
   }

   @PUT
   @Path("/{id:[0-9][0-9]*}")
   @Consumes("application/xml")
   public Response update(@PathParam("id") Long id, Pessoa entity)
   {
      entity.setId(id);
      entity = em.merge(entity);
      return Response.noContent().build();
   }
}