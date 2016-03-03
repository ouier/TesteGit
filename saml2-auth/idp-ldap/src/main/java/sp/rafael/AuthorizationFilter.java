package sp.rafael;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Servlet Filter implementation class AuthorizationFilter
 */
public class AuthorizationFilter implements Filter {



  Logger logger = Logger.getLogger(this.getClass().getName());

  /**
   * Default constructor.
   */
  public AuthorizationFilter() {
    // TODO Auto-generated constructor stub
  }
  
  public static String getName(){
      return "USUARIO";
  }

  /**
   * @see Filter#destroy()
   */
  public void destroy() {
    // TODO Auto-generated method stub
  }

  /**
   * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
   */
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    // TODO Auto-generated method stub
    // place your code here

    // pass the request along the filter chain
    chain.doFilter(request, response);
    logger.info("DO FILTER");
    
  }

  /**
   * @see Filter#init(FilterConfig)
   */
  public void init(FilterConfig fConfig) throws ServletException {
    // TODO Auto-generated method stub
  }

}
