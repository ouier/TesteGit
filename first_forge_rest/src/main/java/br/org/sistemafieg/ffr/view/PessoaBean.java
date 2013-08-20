package br.org.sistemafieg.ffr.view;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.ejb.SessionContext;
import javax.ejb.Stateful;
import javax.enterprise.context.Conversation;
import javax.enterprise.context.ConversationScoped;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import br.org.sistemafieg.ffr.modelo.vo.Pessoa;
import br.org.sistemafieg.ffr.modelo.vo.Endereco;
import java.util.Iterator;

/**
 * Backing bean for Pessoa entities.
 * <p>
 * This class provides CRUD functionality for all Pessoa entities. It focuses
 * purely on Java EE 6 standards (e.g. <tt>&#64;ConversationScoped</tt> for
 * state management, <tt>PersistenceContext</tt> for persistence,
 * <tt>CriteriaBuilder</tt> for searches) rather than introducing a CRUD framework or
 * custom base class.
 */

@Named
@Stateful
@ConversationScoped
public class PessoaBean implements Serializable
{

   private static final long serialVersionUID = 1L;

   /*
    * Support creating and retrieving Pessoa entities
    */

   private Long id;

   public Long getId()
   {
      return this.id;
   }

   public void setId(Long id)
   {
      this.id = id;
   }

   private Pessoa pessoa;

   public Pessoa getPessoa()
   {
      return this.pessoa;
   }

   @Inject
   private Conversation conversation;

   @PersistenceContext(type = PersistenceContextType.EXTENDED)
   private EntityManager entityManager;

   public String create()
   {

      this.conversation.begin();
      return "create?faces-redirect=true";
   }

   public void retrieve()
   {

      if (FacesContext.getCurrentInstance().isPostback())
      {
         return;
      }

      if (this.conversation.isTransient())
      {
         this.conversation.begin();
      }

      if (this.id == null)
      {
         this.pessoa = this.example;
      }
      else
      {
         this.pessoa = findById(getId());
      }
   }

   public Pessoa findById(Long id)
   {

      return this.entityManager.find(Pessoa.class, id);
   }

   /*
    * Support updating and deleting Pessoa entities
    */

   public String update()
   {
      this.conversation.end();

      try
      {
         if (this.id == null)
         {
            this.entityManager.persist(this.pessoa);
            return "search?faces-redirect=true";
         }
         else
         {
            this.entityManager.merge(this.pessoa);
            return "view?faces-redirect=true&id=" + this.pessoa.getId();
         }
      }
      catch (Exception e)
      {
         FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(e.getMessage()));
         return null;
      }
   }

   public String delete()
   {
      this.conversation.end();

      try
      {
         Pessoa deletableEntity = findById(getId());
         Iterator<Endereco> iterEnderecos = deletableEntity.getEnderecos().iterator();
         for (; iterEnderecos.hasNext();)
         {
            Endereco nextInEnderecos = iterEnderecos.next();
            nextInEnderecos.setPessoa(null);
            iterEnderecos.remove();
            this.entityManager.merge(nextInEnderecos);
         }
         this.entityManager.remove(deletableEntity);
         this.entityManager.flush();
         return "search?faces-redirect=true";
      }
      catch (Exception e)
      {
         FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(e.getMessage()));
         return null;
      }
   }

   /*
    * Support searching Pessoa entities with pagination
    */

   private int page;
   private long count;
   private List<Pessoa> pageItems;

   private Pessoa example = new Pessoa();

   public int getPage()
   {
      return this.page;
   }

   public void setPage(int page)
   {
      this.page = page;
   }

   public int getPageSize()
   {
      return 10;
   }

   public Pessoa getExample()
   {
      return this.example;
   }

   public void setExample(Pessoa example)
   {
      this.example = example;
   }

   public void search()
   {
      this.page = 0;
   }

   public void paginate()
   {

      CriteriaBuilder builder = this.entityManager.getCriteriaBuilder();

      // Populate this.count

      CriteriaQuery<Long> countCriteria = builder.createQuery(Long.class);
      Root<Pessoa> root = countCriteria.from(Pessoa.class);
      countCriteria = countCriteria.select(builder.count(root)).where(
            getSearchPredicates(root));
      this.count = this.entityManager.createQuery(countCriteria)
            .getSingleResult();

      // Populate this.pageItems

      CriteriaQuery<Pessoa> criteria = builder.createQuery(Pessoa.class);
      root = criteria.from(Pessoa.class);
      TypedQuery<Pessoa> query = this.entityManager.createQuery(criteria
            .select(root).where(getSearchPredicates(root)));
      query.setFirstResult(this.page * getPageSize()).setMaxResults(
            getPageSize());
      this.pageItems = query.getResultList();
   }

   private Predicate[] getSearchPredicates(Root<Pessoa> root)
   {

      CriteriaBuilder builder = this.entityManager.getCriteriaBuilder();
      List<Predicate> predicatesList = new ArrayList<Predicate>();

      String nome = this.example.getNome();
      if (nome != null && !"".equals(nome))
      {
         predicatesList.add(builder.like(root.<String> get("nome"), '%' + nome + '%'));
      }

      return predicatesList.toArray(new Predicate[predicatesList.size()]);
   }

   public List<Pessoa> getPageItems()
   {
      return this.pageItems;
   }

   public long getCount()
   {
      return this.count;
   }

   /*
    * Support listing and POSTing back Pessoa entities (e.g. from inside an
    * HtmlSelectOneMenu)
    */

   public List<Pessoa> getAll()
   {

      CriteriaQuery<Pessoa> criteria = this.entityManager
            .getCriteriaBuilder().createQuery(Pessoa.class);
      return this.entityManager.createQuery(
            criteria.select(criteria.from(Pessoa.class))).getResultList();
   }

   @Resource
   private SessionContext sessionContext;

   public Converter getConverter()
   {

      final PessoaBean ejbProxy = this.sessionContext.getBusinessObject(PessoaBean.class);

      return new Converter()
      {

         @Override
         public Object getAsObject(FacesContext context,
               UIComponent component, String value)
         {

            return ejbProxy.findById(Long.valueOf(value));
         }

         @Override
         public String getAsString(FacesContext context,
               UIComponent component, Object value)
         {

            if (value == null)
            {
               return "";
            }

            return String.valueOf(((Pessoa) value).getId());
         }
      };
   }

   /*
    * Support adding children to bidirectional, one-to-many tables
    */

   private Pessoa add = new Pessoa();

   public Pessoa getAdd()
   {
      return this.add;
   }

   public Pessoa getAdded()
   {
      Pessoa added = this.add;
      this.add = new Pessoa();
      return added;
   }
}