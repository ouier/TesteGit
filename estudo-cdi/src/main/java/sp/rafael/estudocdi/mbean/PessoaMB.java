package sp.rafael.estudocdi.mbean;

import java.io.Serializable;

import javax.enterprise.inject.Model;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;

import sp.rafael.estudocdi.business.PessoaBO;
import sp.rafael.estudocdi.model.Pessoa;

/**
 * Created by Rafael on 05/01/14.
 */
@Named("pessoaMB")
@Model
public class PessoaMB implements Serializable{

    @Inject
    private FacesContext facesContext;

    @Inject
    private PessoaBO pessoaBo;
    
    private Pessoa pessoa = new Pessoa();


    public void listarPessoas(){
        pessoaBo.listarPessoas();
        FacesMessage m = new FacesMessage(FacesMessage.SEVERITY_INFO, "INFO!", "Nome procurado: "+pessoa.getNome());
        facesContext.addMessage(null, m);
    }


	public Pessoa getPessoa() {
		return this.pessoa;
	}


	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
}
