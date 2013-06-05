package br.org.sistemafieg.springldap.ldap;

import java.util.Hashtable;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.core.AttributesMapper;
import org.springframework.ldap.core.ContextSource;
import org.springframework.ldap.core.DirContextOperations;
import org.springframework.ldap.core.DistinguishedName;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.ldap.core.support.AbstractContextMapper;
import org.springframework.ldap.filter.AndFilter;
import org.springframework.ldap.filter.EqualsFilter;
import org.springframework.ldap.filter.Filter;
import org.springframework.ldap.filter.LikeFilter;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings("all")
public class ADAuthentication {

	@Autowired
	private transient ContextSource contextSource;

	@Autowired
	private transient LdapTemplate ldapTemplate;

	public boolean autenticar(String user, final String password) {
		DirContext ctx = null;
		try {
			AndFilter filter = new AndFilter();
			filter.and(new EqualsFilter("objectclass", "person")).and(new EqualsFilter("userPrincipalName", user));
			boolean bool = false;
			ctx = contextSource.getContext(user, password);
			bool = ctx!=null;
			return bool;
		} catch (Exception e) {
			return false;
		}
	}

	
	
	
	
	
	
	private String getDnForUser(String uid) {
		AndFilter f = new AndFilter();
		f.and(new EqualsFilter("objectclass", "person")).and(new EqualsFilter("userPrincipalName", uid));
		System.err.println(f.toString());
		String filtro = f.toString();
		DistinguishedName dn = new DistinguishedName();
		
		List result = ldapTemplate.search(DistinguishedName.EMPTY_PATH,
				filtro, new AbstractContextMapper() {
					protected Object doMapFromContext(DirContextOperations ctx) {
						return ctx.getNameInNamespace();
					}
				});

		if (result.size() < 1) {
			//throw new RuntimeException("User not found or not unique");
			return "ZERO";
		}else if(result.size()>1){
			String dump = "";
			for (Object object : result) {
				dump += "\n"+object.toString();
			}
			return dump;
		}

		return (String) result.get(0);
	}
	
	 public List getAllPersonNames() {
	      return ldapTemplate.search(
	         "", "(objectclass=person)",
	         new AttributesMapper() {
	            public Object mapFromAttributes(Attributes attrs)
	               throws NamingException {
	               try {
	            	Object o = attrs.get("cn").get();
	            	System.out.println(o.toString());
					return o;
				} catch (Exception e) {
					return "";
				}
	            }
	         });
	   }

}
