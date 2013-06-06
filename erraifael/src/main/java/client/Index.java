package client;

import com.google.gwt.user.client.ui.*;
import com.sencha.gxt.widget.core.client.FramedPanel;
import com.sencha.gxt.widget.core.client.button.TextButton;
import org.jboss.errai.ioc.client.api.EntryPoint;
import org.jboss.errai.ui.shared.api.annotations.DataField;
import org.jboss.errai.ui.shared.api.annotations.Templated;

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
@Templated("#template")
public class Index extends Composite{

    @Inject
    @DataField
    private TextBox nome;

    @PostConstruct
    public void init(){
        nome.setWidth("500px");
        nome.setText("Funcionou mesmo? É mentira!!!!!!!!!!");
        RootPanel.get("geral").add(this);
    }
}
