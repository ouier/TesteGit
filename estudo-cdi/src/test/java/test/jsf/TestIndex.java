package test.jsf;

import java.net.URL;

import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.drone.api.annotation.Drone;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.arquillian.junit.InSequence;
import org.jboss.arquillian.test.api.ArquillianResource;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import test.util.TestDeployment;

@RunWith(Arquillian.class)
public class TestIndex {

    @Drone
    WebDriver driver;

    @ArquillianResource
    URL contextPath;

    @Deployment(testable = false)
    public static WebArchive createDeployment() {
        return TestDeployment.createDeployment();
    }

    @Before
    public void beforeEachTest() {
        driver.manage().deleteAllCookies();
    }

    @Test
    @InSequence(1)
    public void testSuccess() {

        driver.get(contextPath + "index.jsf");
        By botao = By.xpath("//*[@id=\"botao\"]");
        By nome = By.xpath("//*[@id=\"nome\"]");
        driver.findElement(nome).sendKeys("RAFAEL PEREIRA");
        driver.findElement(botao).click();

        By msg 	 = By.xpath("//*[@id=\"msg\"]//li[contains(.,'INFO')]"); 
        WebElement el = driver.findElement(msg);
        boolean isDisplayed = el.isDisplayed();
        Assert.assertTrue("INFO Is displayed", isDisplayed);

    }
    
    @Test
    @InSequence(2)
    public void testFail() {

        driver.get(contextPath + "index.jsf");
        By botao = By.xpath("//*[@id=\"botao\"]");
        driver.findElement(botao).click();

        By msg 	 = By.xpath("//*[@id=\"msg\"]//li[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),'erro')]"); 
        boolean isDisplayed = driver.findElement(msg).isDisplayed();
        Assert.assertTrue("Error Is displayed", isDisplayed);

    }

}
