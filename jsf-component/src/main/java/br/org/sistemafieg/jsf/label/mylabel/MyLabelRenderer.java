package br.org.sistemafieg.jsf.label.mylabel;

import javax.faces.application.ResourceDependencies;
import javax.faces.application.ResourceDependency;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.context.ResponseWriter;
import javax.faces.render.FacesRenderer;
import javax.faces.render.Renderer;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: rafael souza
 * Date: 18/06/13
 * Time: 10:04
 * To change this template use File | Settings | File Templates.
 */
@FacesRenderer(componentFamily = MyLabel.COMPONENT_FAMILY, rendererType = "MyLabel")
@ResourceDependencies({
        @ResourceDependency(name="estilo.css",library="css",target = "head"),
        @ResourceDependency(name="script.js",library = "js",target="head")
})
public class MyLabelRenderer extends Renderer {

    @Override
    public void encodeBegin(FacesContext context, UIComponent component) throws IOException {

        MyLabel label = (MyLabel)component;
        ResponseWriter writer = context.getResponseWriter();
        String borda = "";
        if(label.isTemBorda()){
            borda = "border: 1px dotted "+label.getCor()+";";
        }
        writer.write("<div class=\"myLabel\" style=\"color:"+label.getCor()+";"+borda+"\">"+label.getRotulo()+"</div>");
        writer.flush();

    }
}
