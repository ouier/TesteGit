package br.org.sistemafieg.ffr.modelo.vo;

import javax.persistence.Entity;
import java.io.Serializable;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Column;
import javax.persistence.Version;
import java.lang.Override;
import br.org.sistemafieg.ffr.modelo.vo.Pessoa;
import javax.persistence.ManyToOne;

@Entity
public class Endereco implements Serializable
{

   @Id
   @GeneratedValue(strategy = GenerationType.AUTO)
   @Column(name = "id", updatable = false, nullable = false)
   private Long id = null;
   @Version
   @Column(name = "version")
   private int version = 0;

   @ManyToOne
   private Pessoa pessoa;

   @Column
   private String logradouro;

   @Column
   private String cep;

   @Column
   private String cidade;

   @Column
   private String uf;

   @Column
   private String complemento;

   public Long getId()
   {
      return this.id;
   }

   public void setId(final Long id)
   {
      this.id = id;
   }

   public int getVersion()
   {
      return this.version;
   }

   public void setVersion(final int version)
   {
      this.version = version;
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
         return id.equals(((Endereco) that).id);
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

   public Pessoa getPessoa()
   {
      return this.pessoa;
   }

   public void setPessoa(final Pessoa pessoa)
   {
      this.pessoa = pessoa;
   }

   public String getLogradouro()
   {
      return this.logradouro;
   }

   public void setLogradouro(final String logradouro)
   {
      this.logradouro = logradouro;
   }

   public String getCep()
   {
      return this.cep;
   }

   public void setCep(final String cep)
   {
      this.cep = cep;
   }

   public String getCidade()
   {
      return this.cidade;
   }

   public void setCidade(final String cidade)
   {
      this.cidade = cidade;
   }

   public String getUf()
   {
      return this.uf;
   }

   public void setUf(final String uf)
   {
      this.uf = uf;
   }

   public String getComplemento()
   {
      return this.complemento;
   }

   public void setComplemento(final String complemento)
   {
      this.complemento = complemento;
   }

   @Override
   public String toString()
   {
      String result = getClass().getSimpleName() + " ";
      if (logradouro != null && !logradouro.trim().isEmpty())
         result += "logradouro: " + logradouro;
      if (cep != null && !cep.trim().isEmpty())
         result += ", cep: " + cep;
      if (cidade != null && !cidade.trim().isEmpty())
         result += ", cidade: " + cidade;
      if (uf != null && !uf.trim().isEmpty())
         result += ", uf: " + uf;
      if (complemento != null && !complemento.trim().isEmpty())
         result += ", complemento: " + complemento;
      return result;
   }
}