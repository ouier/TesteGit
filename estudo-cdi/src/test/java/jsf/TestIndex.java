package jsf;

import java.net.URL;
import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.drone.api.annotation.Drone;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.arquillian.test.api.ArquillianResource;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import util.TestDeployment;

@RunWith(Arquillian.class)
public class TestIndex {

    @Test
    public void nothing() {

    }

    @Drone
    WebDriver driver;

    @ArquillianResource
    URL contextPath;
//	

    @Deployment(testable = false)
    public static WebArchive createDeployment() {
        return TestDeployment.createDeployment();
    }

    @Before
    public void beforeEachTest() {
        driver.manage().deleteAllCookies();
    }

    @Test
    public void test() {

        driver.get(contextPath + "index.jsf");
        By botao = By.xpath("//*[@id=\"botao\"]");
        driver.findElement(botao).click();

        By msg 	 = By.xpath("//*[@id=\"msg\"]//li[contains(.,'INFO')]"); 
        //By msg = By.xpath("//*[@id=\"msg\"]");
        WebElement el = driver.findElement(msg);
        System.out.println("========================== ELEMENT: " + el);

        By nome = By.xpath("//*[@id=\"nome\"]");
        driver.findElement(nome).sendKeys("RAFAEL PEREIRA");
        System.out.println("========================== ELEMENT: " + driver.findElement(nome));

    }

}
