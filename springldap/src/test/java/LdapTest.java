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

    public static String URL_DOMINIO = "ldap://dco-01.sistemafieg.net:389/DC=sistemafieg,DC=net";
    public static String DOMINIO = "sistemafieg\\";
    public static String USUARIO_1 = DOMINIO+"rafael souza";
    public static String SENHA_USUARIO_1 = "ouierounou";
    public static String USUARIO_2 = DOMINIO+"cristiano vieira";
    public static String SENHA_USUARIO_2 = "tudopossoemdeus";

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
		assertTrue(adAuth.autenticar(USUARIO_1, SENHA_USUARIO_1));
	}

	
	@Test
	public void testeAuthSucc2(){
		assertTrue(adAuth.autenticar(USUARIO_2, SENHA_USUARIO_2));
	}
	
	@Test
	public void testeAuthFail1(){
		assertFalse(adAuth.autenticar(USUARIO_1, "senhainvalida"));
	}
	
	@Test
	public void testeFail2(){
		assertFalse(adAuth.autenticar(USUARIO_2, "falha4"));
	}
	
	@Test
	public void javaPuroAcc(){
		assertTrue(testar(USUARIO_1, SENHA_USUARIO_1));
		
	}
	
	@Test
	public void javaPuroFail(){
		assertFalse(testar(SENHA_USUARIO_1, "senha errada"));
	}
	
	public boolean testar(String user, String password){
		try
	    {
	        // Set up the environment for creating the initial context
	        Hashtable<String, String> env = new Hashtable<String, String>();
	        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
	        env.put(Context.PROVIDER_URL, URL_DOMINIO);
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
