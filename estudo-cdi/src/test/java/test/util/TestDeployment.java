package test.util;

import java.io.File;

import org.jboss.shrinkwrap.api.Filters;
import org.jboss.shrinkwrap.api.GenericArchive;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.importer.ExplodedImporter;
import org.jboss.shrinkwrap.api.spec.WebArchive;

public class TestDeployment {
	
	public static final String WEB_SRC="src/main/webapp";
	public static final String MAIN_SRC="src/main/java";
	public static final String MAIN_RESOURCES="src/main/resources";
	
	public static WebArchive createDeployment() {
		 
        WebArchive war = ShrinkWrap.create(WebArchive.class)
        		
                // add classes
        		.addPackages(true,"sp.rafael")
                
                //websrc
                .merge(ShrinkWrap.create(GenericArchive.class).as(ExplodedImporter.class).importDirectory(WEB_SRC).as(GenericArchive.class),
                		"/",Filters.include(".*\\.xhtml$"))
                		
                //Resources
                .addAsResource(new File(MAIN_RESOURCES+"/META-INF/persistence.xml"), "META-INF/persistence.xml")
                .addAsWebInfResource(new File(WEB_SRC+"/WEB-INF/beans.xml"))
                .addAsWebInfResource(new File(WEB_SRC+"/WEB-INF/faces-config.xml"));
 
        return war;
    }

}
