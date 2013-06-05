package client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.event.dom.client.MouseDownEvent;
import com.google.gwt.event.dom.client.MouseDownHandler;
import com.google.gwt.user.client.ui.*;

/**
 * Created with IntelliJ IDEA.
 * User: rafael souza
 * Date: 05/06/13
 * Time: 10:49
 * To change this template use File | Settings | File Templates.
 */
public class Hello implements EntryPoint {
    public void onModuleLoad() {

        Button botao = new Button();
        botao.setText("Clique neste botão");
        botao.addMouseDownHandler(new MouseDownHandler() {
            @Override
            public void onMouseDown(MouseDownEvent event) {
                System.out.println("Hello Rafael Pereira");
            }
        });

        RootPanel.get().add(botao);
    }
}
