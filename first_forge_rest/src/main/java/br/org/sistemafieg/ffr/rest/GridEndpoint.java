package br.org.sistemafieg.ffr.rest;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;

import br.org.sistemafieg.ffr.modelo.vo.Pessoa;
import br.org.sistemafieg.ffr.modelo.vo.Row;
import br.org.sistemafieg.ffr.modelo.vo.Rows;

@Stateless
@Path("/pessoas2")
public class GridEndpoint {

	@Inject
	private PessoaEndpoint pessoaEndpoint;

	@PersistenceContext(unitName = "forge-default")
	private EntityManager em;

	@POST
	@Consumes("application/json")
	public Response create(Pessoa entity) {
		
		if (!em.contains(entity))
			entity = em.merge(entity);
		em.persist(entity);
		em.flush();
		Rows rows = new Rows();
		rows.setRows(new ArrayList<Row>());
		Row row = pessoaToRows(entity);
		row.setId(0);
		rows.getRows().add(row);
		return Response.created(UriBuilder.fromResource(GridEndpoint.class).path(String.valueOf(row.getId())).build()).build();
	}

	@GET
	@Produces("application/json")
	public Rows listAll() {
		Rows rows = new Rows();
		rows.setRows(new ArrayList<Row>());
		List<Pessoa> pessoas = pessoaEndpoint.listAll();
		long i=0;
		for (Pessoa pessoa : pessoas) {
			Row row = pessoaToRows(pessoa);
			row.setId(i);
			rows.getRows().add(row);
			i++;
		}
		return rows;
	}
	
	protected Row pessoaToRows(Pessoa p){
		Row row = new Row();
		row.setData(new ArrayList<String>());
		row.getData().add(String.valueOf(p.getId()));
		row.getData().add(p.getNome());
		return row;
	}

}
