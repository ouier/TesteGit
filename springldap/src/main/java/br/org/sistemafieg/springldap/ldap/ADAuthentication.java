package br.org.sistemafieg.springldap.ldap;

import java.util.List;

import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.core.AttributesMapper;
import org.springframework.ldap.core.ContextSource;
import org.springframework.ldap.core.DirContextOperations;
import org.springframework.ldap.core.DistinguishedName;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.ldap.core.support.AbstractContextMapper;
import org.springframework.ldap.filter.AndFilter;
import org.springframework.ldap.filter.EqualsFilter;
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
			//filter.and(new EqualsFilter("objectclass", "user")).and(new EqualsFilter("sAMAccountName", user));
			boolean bool = false;
			user = "CN="+user+",CN=Users,DC=redesistemafieg,DC=net";
			ctx = contextSource.getContext(user, password);
			bool = ctx!=null;
			return bool;
		} catch (Exception e) {
			return false;
		}
	}

	
	
	
	
	
	
	public String getDnForUser(String uid) {
		AndFilter f = new AndFilter();
		f.and(new EqualsFilter("objectclass", "user")).and(new EqualsFilter("sAMAccountName", uid));
		//f.and(new EqualsFilter("objectclass", "user")).and(new EqualsFilter("userPrincipalName", uid));
		System.err.println(f.toString());
		String filtro = f.encode();
		DistinguishedName dn = new DistinguishedName();
		
		List result = ldapTemplate.search(DistinguishedName.EMPTY_PATH,
				filtro, new AbstractContextMapper() {
					@Override
					protected Object doMapFromContext(DirContextOperations ctx) {
						StringBuilder attrs = new StringBuilder();
						attrs.append("sAMAccountName: ");
						attrs.append(ctx.getStringAttribute("sAMAccountName"));
				        attrs.append(",");
				        attrs.append("cn: ");
				        attrs.append(ctx.getStringAttribute("cn"));
				        attrs.append(",");
				        attrs.append("department: ");
				        attrs.append(ctx.getStringAttribute("department"));
				        attrs.append(",");
				        attrs.append("sn: ");
				        attrs.append(ctx.getStringAttribute("sn"));
				        attrs.append(",");
				        attrs.append("displayname: ");
				        attrs.append(ctx.getStringAttribute("displayname"));
				        attrs.append(",");
				        attrs.append("physicaldeliveryofficename: ");
				        attrs.append(ctx.getStringAttribute("physicaldeliveryofficename"));
				        attrs.append(",");
				        attrs.append("name: ");
				        attrs.append(ctx.getStringAttribute("name"));
				        attrs.append(",description: ");
				        attrs.append(ctx.getStringAttribute("description"));
						return attrs.toString();
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
		
		StringBuilder strUsuario = new StringBuilder();
		for(int i=0;i<result.size();i++){
			strUsuario.append(result.get(i));
		}

		return (String) result.get(0);
	}
	
	 public List getAllPersonNames() {
	      return ldapTemplate.search(
	         "", "(objectclass=person)",
	         new AttributesMapper() {
	            @Override
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
