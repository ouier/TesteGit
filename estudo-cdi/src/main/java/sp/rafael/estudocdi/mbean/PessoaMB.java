package sp.rafael.estudocdi.mbean;

import java.io.Serializable;

import javax.ejb.SessionBean;
import javax.enterprise.inject.Model;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.InitialContext;
import javax.naming.NamingException;

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


    public void listarPessoas() throws Exception{
        enviarMail();
        pessoaBo.listarPessoas();
        FacesMessage m = new FacesMessage(FacesMessage.SEVERITY_INFO, "INFO!", "Nome procurado: "+pessoa.getNome());
        facesContext.addMessage(null, m);
    }

    public void enviarMail() throws Exception {
        InitialContext context = new InitialContext();

        Session sss= (Session) context.lookup("java:jboss/mail/Default");

        Message message = new MimeMessage(sss);
        message.setFrom(new InternetAddress("mailsender@sistemafieg.org.br")); //Remetente

        Address[] toUser = InternetAddress //Destinatário(s)
                .parse("rafael.hardrock@gmail.com, rafaelsouza@sistemafieg.org.br");

        message.setRecipients(Message.RecipientType.TO, toUser);
        message.setSubject("Enviando email com JavaMail");//Assunto
        message.setText("Enviei este email utilizando JavaMail com minha conta TESTE!");
        /**Método para enviar a mensagem criada*/
        Transport.send(message);

        System.out.println("Feito!!!");




    }


	public Pessoa getPessoa() {
		return this.pessoa;
	}


	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
}
