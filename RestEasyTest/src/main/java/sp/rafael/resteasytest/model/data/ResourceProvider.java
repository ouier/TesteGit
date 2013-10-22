
/*
* To change this template, choose Tools | Templates
* and open the template in the editor.
 */
package sp.rafael.resteasytest.model.data;

//~--- JDK imports ------------------------------------------------------------

import javax.enterprise.context.RequestScoped;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

/**
 *
 * @author rafael
 */
public class ResourceProvider {
    @PersistenceUnit
    private EntityManagerFactory entityManagerFactory;

    @Produces
    @RequestScoped
    protected EntityManager createEntityManager() {
        return this.entityManagerFactory.createEntityManager();
    }

    protected void closeEntityManager(@Disposes EntityManager entityManager) {
        if (entityManager.isOpen()) {
            entityManager.close();
        }
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
