package client;

import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.RootPanel;
import org.jboss.errai.ioc.client.api.EntryPoint;
import server.SampleService;
import ui.FormTeste;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

/**
 * Created with IntelliJ IDEA.
 * User: rafael souza
 * Date: 06/06/13
 * Time: 11:44
 * To change this template use File | Settings | File Templates.
 */

@EntryPoint
public class Index extends Composite{

    @Inject
    SampleService sampleService;

    @PostConstruct
    public void init(){

        System.out.println("====================> INIT TESTE");

        FormTeste formulario = new FormTeste();
        RootPanel.get("formulario").add(formulario);
        formulario.show();
        formulario.setSampleService(sampleService);

        System.out.println("====================> FIM TESTE");
    }
}
