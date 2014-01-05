package sp.rafael.estudocdi.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;

/**
 * Created by Rafael on 05/01/14.
 */
@MappedSuperclass
public abstract class BaseEntity<ID extends Serializable> implements Serializable{

    protected ID id;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public ID getId() {
        return id;
    }

    public void setId(ID id) {
        this.id = id;
    }

}
