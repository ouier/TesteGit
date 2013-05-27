import javax.inject.Inject;

import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.Archive;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.asset.EmptyAsset;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;

import br.org.sistemafieg.hello.controle.Hello;
import br.org.sistemafieg.hello.modelo.negocio.PessoaNegocio;
import br.org.sistemafieg.hello.modelo.persistencia.DAO;
import br.org.sistemafieg.hello.modelo.to.Pessoa;

@RunWith(Arquillian.class)
public class HelloTest {

	
	@Inject
	Hello hello;
	
	
	@Deployment
	public static Archive<?> createDeployment(){
		Archive<?> war = ShrinkWrap.create(WebArchive.class,"hello.war")
				.addPackage(Hello.class.getPackage())
				.addPackage(PessoaNegocio.class.getPackage())
				.addPackage(DAO.class.getPackage())
				.addPackage(Pessoa.class.getPackage())
				.addAsResource("META-INF/persistence.xml","META-INF/persistence.xml")
				.addAsResource("log4j.xml", "log4j.xml")
				.addAsWebInfResource(EmptyAsset.INSTANCE,"beans.xml")
				;
		System.out.println(war.toString(true));
		return war;
	}
	
	@Test
	public void testeHello(){
		Assert.assertNotNull(hello);
		System.out.println("HELLO NÃO É NULO");
	}
	
	
}
