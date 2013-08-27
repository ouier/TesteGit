package sp.rafael.myparent.model.to;

import javax.persistence.Entity;
import java.io.Serializable;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Column;
import javax.persistence.Version;
import java.lang.Override;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@XmlRootElement
public class Pessoa implements Serializable
{

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO)
   @Column(name = "id", updatable = false, nullable = false)
   private Long id = null;
   @Column
   private String nome;

   @Temporal(TemporalType.DATE)
   private Date dataNascimento;

   @Column
   private String nomeMae;

   @Column
   private String nomePai;

   public Long getId()
   {
      return this.id;
   }

   public void setId(final Long id)
   {
      this.id = id;
   }

   @Override
   public boolean equals(Object that)
   {
      if (this == that)
      {
         return true;
      }
      if (that == null)
      {
         return false;
      }
      if (getClass() != that.getClass())
      {
         return false;
      }
      if (id != null)
      {
         return id.equals(((Pessoa) that).id);
      }
      return super.equals(that);
   }

   @Override
   public int hashCode()
   {
      if (id != null)
      {
         return id.hashCode();
      }
      return super.hashCode();
   }

   public String getNome()
   {
      return this.nome;
   }

   public void setNome(final String nome)
   {
      this.nome = nome;
   }

   public Date getDataNascimento()
   {
      return this.dataNascimento;
   }

   public void setDataNascimento(final Date dataNascimento)
   {
      this.dataNascimento = dataNascimento;
   }

   public String getNomeMae()
   {
      return this.nomeMae;
   }

   public void setNomeMae(final String nomeMae)
   {
      this.nomeMae = nomeMae;
   }

   public String getNomePai()
   {
      return this.nomePai;
   }

   public void setNomePai(final String nomePai)
   {
      this.nomePai = nomePai;
   }

   @Override
   public String toString()
   {
      String result = getClass().getSimpleName() + " ";
      if (nome != null && !nome.trim().isEmpty())
         result += "nome: " + nome;
      if (nomeMae != null && !nomeMae.trim().isEmpty())
         result += ", nomeMae: " + nomeMae;
      if (nomePai != null && !nomePai.trim().isEmpty())
         result += ", nomePai: " + nomePai;
      return result;
   }
}