package client;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;
import com.google.gwt.core.client.GWT;

/**
 * Created with IntelliJ IDEA.
 * User: rafael souza
 * Date: 05/06/13
 * Time: 14:31
 * To change this template use File | Settings | File Templates.
 */
@RemoteServiceRelativePath("HelloService")
public interface HelloService extends RemoteService {
    /**
     * Utility/Convenience class.
     * Use HelloService.App.getInstance() to access static instance of HelloServiceAsync
     */

    public String getMessage(String msg);

    public static class App {
        private static final HelloServiceAsync ourInstance = (HelloServiceAsync) GWT.create(HelloService.class);

        public static HelloServiceAsync getInstance() {
            return ourInstance;
        }
    }
}
