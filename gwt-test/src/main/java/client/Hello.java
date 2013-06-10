package client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.event.dom.client.MouseDownEvent;
import com.google.gwt.event.dom.client.MouseDownHandler;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.*;

/**
 * Created with IntelliJ IDEA.
 * User: rafael souza
 * Date: 05/06/13
 * Time: 14:23
 * To change this template use File | Settings | File Templates.
 */
public class Hello implements EntryPoint {
    public void onModuleLoad() {

        final RichTextArea textArea = new RichTextArea();
        final Button  btnSubmit = new Button();
        final TextBox txNome = new TextBox();

        btnSubmit.setText("Enviar mensagem");
        RootPanel.get("mensagem").add(txNome);
        RootPanel.get("botao_submit").add(btnSubmit);
        RootPanel.get("msg_area").add(textArea);

        btnSubmit.addMouseDownHandler(new MouseDownHandler() {
            @Override
            public void onMouseDown(MouseDownEvent event) {
                HelloService.App.getInstance().getMessage(txNome.getText(), new AsyncCallback<String>() {
                    @Override
                    public void onFailure(Throwable caught) {
                        Window.alert("DEU ERRO");
                    }

                    @Override
                    public void onSuccess(String result) {
                        textArea.setText(textArea.getText()+result+"\n");
                    }
                });
            }
        });

}
}
