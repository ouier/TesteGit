import static junit.framework.Assert.assertFalse;
import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

import java.util.Hashtable;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.context.WebApplicationContext;

import br.org.sistemafieg.springldap.ldap.ADAuthentication;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/resources/META-INF/root-context.xml")
public class LdapTest {

	@Autowired
	private WebApplicationContext wac;
	
	private MockMvc mockMvc;
	
	@Autowired
	private ADAuthentication adAuth;
	
	@Before
	public void setup(){
		this.mockMvc = webAppContextSetup(this.wac).build();

	}
	
	@Test
	public void testeAdAuth(){
		assertNotNull(adAuth);
		System.out.println("Não é nulo");
	}
	
	@Test
	public void testeMockMvc(){
		assertNotNull(mockMvc);
		System.out.println("mockMvc não é nulo");
	}
	
	@Test
	public void testeAuthSucc1(){
		//assertTrue(adAuth.autenticar("rafael souza@sistemafieg.net", "ouierounou"));
		assertTrue(adAuth.autenticar("sistemafieg\\rafael souza", "ouierounou"));
		System.out.println("rafael souza@sistemafieg.net Autenticado 1 :D");
	}

	
	@Test
	public void testeAuthSucc2(){
		assertTrue(adAuth.autenticar("sistemafieg\\cristiano vieira", "tudopossoemdeus"));
/*		assertTrue(adAuth.autenticar("cristiano vieira@sistemafieg.net", "tudopossoemdeus"));
*/		System.out.println("cristiano vieira@sistemafieg.net Autenticado 1 :D");
	}
	
	@Test
	public void testeAuthFail1(){
		assertFalse(adAuth.autenticar("sistemafieg\\cristiano vieira", "senhainvalida"));
		System.out.println("cristiano vieira@sistemafieg.net Falhou ao autenticar :(");
	}
	
	@Test
	public void testeFail2(){
		assertFalse(adAuth.autenticar("sistemafieg\\rafael souza", "falha4"));
		System.out.println("rafael souza@sistemafieg.net Autenticado 1 :D");
	}
	
	@Test
	public void javaPuroAcc(){
		assertTrue(testar("sistemafieg\\rafael souza", "ouierounou"));
		
	}
	
	@Test
	public void javaPuroFail(){
		assertFalse(testar("sistemafieg\\rafael souza", "senha errada"));
	}
	
	public boolean testar(String user, String password){
		try
	    {
	        // Set up the environment for creating the initial context
	        Hashtable<String, String> env = new Hashtable<String, String>();
	        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
	        env.put(Context.PROVIDER_URL, "ldap://dco-01.sistemafieg.net:389/DC=sistemafieg,DC=net");
	        // 
	        env.put(Context.SECURITY_AUTHENTICATION, "simple");
	        env.put(Context.SECURITY_PRINCIPAL, user);
	        env.put(Context.SECURITY_CREDENTIALS, password);

	        // Create the initial context

	        DirContext ctx = new InitialDirContext(env);
	        boolean result = ctx != null;

	        if(ctx != null)
	            ctx.close();
	        
	        return result;

	    }
	    catch (Exception e)
	    {
	    	return false;
	    }
	}
	
}
