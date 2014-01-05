package sp.rafael.estudocdi.dao;

import sp.rafael.estudocdi.model.BaseEntity;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Created by Rafael on 05/01/14.
 */
public class DAO<E extends BaseEntity, ID extends Serializable> implements Serializable{

    @PersistenceContext
    private EntityManager entityManager;
    private Class clazz;

    public EntityManager getEntityManager() {
        return entityManager;
    }

    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public Class getClazz() {
        if(clazz==null){
            clazz = (Class) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        }
        return clazz;
    }

    public void setClazz(Class clazz) {
        this.clazz = clazz;
    }

    public List findAll() {
        return entityManager.createQuery("Select entity FROM "+getClazz().getSimpleName() +" entity").getResultList();
    }
}
