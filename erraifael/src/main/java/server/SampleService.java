package server;

import javax.enterprise.context.ApplicationScoped;

/**
 * Created with IntelliJ IDEA.
 * User: rafael souza
 * Date: 07/06/13
 * Time: 16:19
 * To change this template use File | Settings | File Templates.
 */
@ApplicationScoped
public class SampleService {

    public String saySomething(final String msg){
        System.out.println(msg);
        return "=> "+msg;
    }
}
