
/*
* To change this template, choose Tools | Templates
* and open the template in the editor.
 */
package sp.rafael.resteasytest.rest;

//~--- non-JDK imports --------------------------------------------------------

//~--- JDK imports ------------------------------------------------------------
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;

import sp.rafael.resteasytest.model.data.PessoaDAO;
import sp.rafael.resteasytest.model.to.Pessoa;

/**
 *
 * @author rafael
 */
@Path("/pessoas")
@Stateless
public class PessoaRest{
    @Inject
    private PessoaDAO pessoaDao;

    @GET
    @Produces(value = { "application/json;charset=utf-8" })
    public List<Pessoa> getPessoas() {
        return pessoaDao.findAllOrderedByName();
    }
    
    @POST
    @Produces(value = { "application/json;charset=utf-8" })
    @Consumes(value={"application/json"})
    public Response postarPessoa(Pessoa pessoa){
    	return Response.created(UriBuilder.fromResource(PessoaRest.class).path(String.valueOf(pessoa.getId())).build()).build();
    }
    
}