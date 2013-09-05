package sp.rafael.myparent.login;

import javax.enterprise.context.SessionScoped;
import javax.enterprise.inject.Any;
import javax.enterprise.inject.Produces;

public class LoginProducer {

	
	@Produces @Any @SessionScoped
	public Login getLogin(){
		return new Login();
	}
	
}
