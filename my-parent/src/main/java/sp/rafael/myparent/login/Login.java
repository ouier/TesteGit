package sp.rafael.myparent.login;

import java.io.Serializable;

import sp.rafael.myparent.model.to.Pessoa;

public class Login implements Serializable {
	
	private Pessoa pessoaLogada;

	public Pessoa getPessoaLogada(){
		return this.pessoaLogada;
	}
	
	public void setPessoaLogada(Pessoa p){
		this.pessoaLogada = p;
	}

	@Override
	public String toString() {
		return "Login [pessoaLogada=" + pessoaLogada + "]";
	}

	
	
}
