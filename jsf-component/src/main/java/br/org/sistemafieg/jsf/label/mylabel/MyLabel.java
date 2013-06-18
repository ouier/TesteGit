package br.org.sistemafieg.jsf.label.mylabel;

import javax.faces.component.FacesComponent;
import javax.faces.component.UIOutput;
import javax.faces.context.FacesContext;

/**
 * Created with IntelliJ IDEA.
 * User: rafael souza
 * Date: 18/06/13
 * Time: 09:52
 * To change this template use File | Settings | File Templates.
 */
@FacesComponent("MyLabel")
public class MyLabel extends UIOutput {

    private String rotulo;
    private String cor;

    public boolean isTemBorda() {
        return temBorda;
    }

    public void setTemBorda(boolean temBorda) {
        this.temBorda = temBorda;
    }

    private boolean temBorda;

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    @Override
    public String getFamily(){
        return COMPONENT_FAMILY;
    }

    @Override
    public Object saveState(FacesContext context) {

        Object[] values = new Object[4];
        values[0] = super.saveState(context);
        values[1] = getRotulo();
        values[2] = getCor();
        values[3] = isTemBorda();
        return (Object)values;
    }

    @Override
    public void restoreState(FacesContext context, Object state) {
        Object[] values = (Object[])state;
        super.restoreState(context, values[0]);
        setRotulo((String)values[1]);
        setCor((String)values[2]);
        setTemBorda((Boolean)values[3]);
    }


    public String getRotulo() {
        return rotulo;
    }

    public void setRotulo(String rotulo) {
        this.rotulo = rotulo;
    }
}
