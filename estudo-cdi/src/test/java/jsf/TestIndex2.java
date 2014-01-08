package jsf;

import org.jboss.arquillian.drone.api.annotation.Drone;
import org.jboss.arquillian.junit.Arquillian;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.WebDriver;

@RunWith(Arquillian.class)
public class TestIndex2 {
	
    
    @Test
    public void nothing(){
        
    }
    
    @Drone
    WebDriver driver;
 
    @Test
    public void testHappyPath(){
        driver.get("http://www.google.com");
        String pageTitle = driver.getTitle();
        Assert.assertEquals(pageTitle, "Google"); 
    }
	

}
