package ui;

import com.google.gwt.core.client.GWT;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.sencha.gxt.data.shared.TreeStore;
import com.sencha.gxt.widget.core.client.ContentPanel;
import com.sencha.gxt.widget.core.client.TabItemConfig;
import com.sencha.gxt.widget.core.client.TabPanel;
import com.sencha.gxt.widget.core.client.Window;
import com.sencha.gxt.widget.core.client.box.MessageBox;
import com.sencha.gxt.widget.core.client.button.TextButton;
import com.sencha.gxt.widget.core.client.container.AccordionLayoutContainer;
import com.sencha.gxt.widget.core.client.event.SelectEvent;
import server.SampleService;

/**
 * Created with IntelliJ IDEA.
 * User: rafael souza
 * Date: 07/06/13
 * Time: 13:26
 * To change this template use File | Settings | File Templates.
 */

public class FormTeste extends Window{

    private SampleService sampleService;

    public void setSampleService(SampleService sampleService) {
        this.sampleService = sampleService;
    }

    public FormTeste() {
        this.setHeadingText("Esta é uma janela :D");

        final Label lblNome = new Label("Nome:");
        final TextBox txNome = new TextBox();
        txNome.setWidth("500px");
        HorizontalPanel hpanel = new HorizontalPanel();
        hpanel.add(lblNome);
        hpanel.add(txNome);

        TextButton btnSend = new TextButton("Enviar");
        btnSend.addSelectHandler(new SelectEvent.SelectHandler() {
            @Override
            public void onSelect(SelectEvent selectEvent) {
                new MessageBox("Info", sampleService.saySomething(txNome.getText())).show();
            }
        });
        HorizontalPanel hpanelBotoes = new HorizontalPanel();
        hpanelBotoes.add(btnSend);

        VerticalPanel vpanel = new VerticalPanel();
        vpanel.add(hpanel);
        vpanel.add(hpanelBotoes);

        this.add(vpanel);
    }

}
