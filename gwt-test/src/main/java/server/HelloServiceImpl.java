package server;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;
import client.HelloService;

/**
 * Created with IntelliJ IDEA.
 * User: rafael souza
 * Date: 05/06/13
 * Time: 14:31
 * To change this template use File | Settings | File Templates.
 */
public class HelloServiceImpl extends RemoteServiceServlet implements HelloService {
    @Override
    public String getMessage(String msg) {
        return "Java  says: "+msg;
    }
}