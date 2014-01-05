package sp.rafael.estudocdi.mbean;

import sp.rafael.estudocdi.business.PessoaBO;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;
import java.io.Serializable;

/**
 * Created by Rafael on 05/01/14.
 */
@Named("pessoaMB")
public class PessoaMB implements Serializable{

    @Inject
    private FacesContext facesContext;

    @Inject
    private PessoaBO pessoaBo;


    public void listarPessoas(){
        pessoaBo.listarPessoas();
        FacesMessage m = new FacesMessage(FacesMessage.SEVERITY_INFO, "INFO!", "LISTAR PESSOAS");
        facesContext.addMessage(null, m);
    }
}
