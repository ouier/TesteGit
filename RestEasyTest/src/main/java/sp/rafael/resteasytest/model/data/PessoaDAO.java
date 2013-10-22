
/*
* To change this template, choose Tools | Templates
* and open the template in the editor.
 */
package sp.rafael.resteasytest.model.data;

//~--- non-JDK imports --------------------------------------------------------

//~--- JDK imports ------------------------------------------------------------
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import sp.rafael.resteasytest.model.to.Pessoa;

/**
 *
 * @author rafael
 */
@ApplicationScoped
public class PessoaDAO {
    @Inject
    private EntityManager entityManager;

    public EntityManager getEntityManager() {
        return entityManager;
    }

    public List<Pessoa> findAllOrderedByName() {
        CriteriaBuilder       cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Pessoa> criteria;

        criteria = cb.createQuery(Pessoa.class);

        Root<Pessoa> pessoa = criteria.from(Pessoa.class);

        criteria.select(pessoa).orderBy(cb.asc(pessoa.get("nome")));

        return entityManager.createQuery(criteria).getResultList();
    }
    
    @PostConstruct
    public void criarPessoas(){
    	
    	Pessoa p;
    	
    	p = new Pessoa();
    	p.setNome("Rafael Pereira");
    	p.setDataNascimento(new Date(10,10,1982));
    	p.setNomeMae("Maria Pereira");
    	p.setNomePai("Joaquim Pereira");
    	
    	entityManager.persist(p);
    	
    	p = new Pessoa();
    	p.setNome("Keyla Pereira");
    	p.setDataNascimento(new Date(20,04,1982));
    	p.setNomeMae("Fátima Morais");
    	p.setNomePai("Cleiton Morais");
    	
    	entityManager.persist(p);
    	
    	p = new Pessoa();
    	p.setNome("Maria Pereira");
    	p.setDataNascimento(new Date(15,02,1961));
    	p.setNomeMae("Jaime Souza");
    	p.setNomePai("Valdeci Souza");
    	
    	entityManager.persist(p);
    	
    	p = new Pessoa();
    	p.setNome("Joaquim Pereira");
    	p.setDataNascimento(new Date(14,11,1953));
    	p.setNomeMae("Zulmira Pereira");
    	p.setNomePai("Otaviano Pereira");
    	
    	entityManager.persist(p);
    	
    }
}

//~ Formatted by Jindent --- http://www.jindent.com
