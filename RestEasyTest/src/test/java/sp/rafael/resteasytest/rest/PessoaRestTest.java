
/*
* To change this template, choose Tools | Templates
* and open the template in the editor.
 */
package sp.rafael.resteasytest.rest;

//~--- non-JDK imports --------------------------------------------------------

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author rafael
 */
public class PessoaRestTest {
    private HttpClient client = new HttpClient();

    public PessoaRestTest() {}

    @BeforeClass
    public static void setUpClass() {}

    @AfterClass
    public static void tearDownClass() {}

    @Before
    public void setUp() {}

    @After
    public void tearDown() {}

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}

    @Test
    public void deveTestarGETPessoas() {
        GetMethod method = new GetMethod("http://localhost:18080/RestEasyTest/pessoas");
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
