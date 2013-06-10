package client;

import com.google.gwt.user.client.rpc.AsyncCallback;

/**
 * Created with IntelliJ IDEA.
 * User: rafael souza
 * Date: 05/06/13
 * Time: 14:31
 * To change this template use File | Settings | File Templates.
 */
public interface HelloServiceAsync {

    public void getMessage(String msg,AsyncCallback<String> callback);
}
