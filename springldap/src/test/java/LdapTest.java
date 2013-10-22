import static junit.framework.Assert.assertNotSame;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

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

	private static final String URL_DOMINIO="ldap://10.21.152.1:389";
	
	@Autowired
	private WebApplicationContext wac;
	
	private MockMvc mockMvc;
	
	@Autowired
	private ADAuthentication adAuth;
	
	@Before
	public void setup(){
		this.mockMvc = webAppContextSetup(this.wac).build();

	}
	
	/*@Test
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
		assertTrue(adAuth.autenticar("dominio\\user", "senhavalida"));
	}

	
	@Test
	public void testeAuthSucc2(){
		assertTrue(adAuth.autenticar("dominio\\user", "senhavalida"));
	}
	
	@Test
	public void testeAuthFail1(){
		assertFalse(adAuth.autenticar("dominio\\user", "senhainvalida"));
	}
	
	@Test
	public void testeFail2(){
		assertFalse(adAuth.autenticar("dominio\\user", "falha4"));
	}
	
	@Test
	public void javaPuroAcc(){
		assertTrue(testar("dominio\\user", "senhavalida"));
		
	}
	
	@Test
	public void javaPuroFail(){
		assertFalse(testar("dominio\\user", "senha errada"));
	}
	
	public boolean testar(String user, String password){
		try
	    {
	        // Set up the environment for creating the initial context
	        Hashtable<String, String> env = new Hashtable<String, String>();
	        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
	        //env.put(Context.PROVIDER_URL, "ldap://url-dominio:389/DC=sistemafieg,DC=net");
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
	}*/
        
        @Test
        public void fazProcuraDoUsuario(){
            String usu = "rafaelsouza";
            String resultado = adAuth.getDnForUser(usu);
            System.err.println(resultado);
            assertNotSame("ERRO", "ZERO", resultado);
        }
	
}
