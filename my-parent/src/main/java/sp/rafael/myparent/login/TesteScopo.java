package sp.rafael.myparent.login;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

public class TesteScopo implements Serializable{

	@Inject Login login;
	
	@PostConstruct
	public void teste(){
		System.out.println("construiu");
		System.out.println("TESTESCOPO=>"+login);
	}
}
