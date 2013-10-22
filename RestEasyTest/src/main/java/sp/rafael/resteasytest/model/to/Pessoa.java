
/*
* To change this template, choose Tools | Templates
* and open the template in the editor.
 */
package sp.rafael.resteasytest.model.to;

//~--- JDK imports ------------------------------------------------------------

import java.io.Serializable;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author rafael
 */
@Entity
@XmlRootElement
@Table(name = "PESSOAS")
public class Pessoa implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PES_ID")
    private Long              id;
    @Column(name = "PES_NOME")
    private String            nome;
    @Column(name = "PES_DATA_NASCIMENTO")
    @Temporal(value = TemporalType.DATE)
    private Date              dataNascimento;
    @Column(name = "PES_NOME_MAE")
    private String            nomeMae;
    @Column(name = "PES_NOME_PAI")
    private String            nomePai;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getNomeMae() {
        return nomeMae;
    }

    public void setNomeMae(String nomeMae) {
        this.nomeMae = nomeMae;
    }

    public String getNomePai() {
        return nomePai;
    }

    public void setNomePai(String nomePai) {
        this.nomePai = nomePai;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 3;

        hash = 73 * hash + ((this.id != null)
                            ? this.id.hashCode()
                            : 0);
        hash = 73 * hash + ((this.nome != null)
                            ? this.nome.hashCode()
                            : 0);
        hash = 73 * hash + ((this.dataNascimento != null)
                            ? this.dataNascimento.hashCode()
                            : 0);
        hash = 73 * hash + ((this.nomeMae != null)
                            ? this.nomeMae.hashCode()
                            : 0);
        hash = 73 * hash + ((this.nomePai != null)
                            ? this.nomePai.hashCode()
                            : 0);

        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }

        if (getClass() != obj.getClass()) {
            return false;
        }

        final Pessoa other = (Pessoa) obj;

        if ((this.id != other.id) && ((this.id == null) ||!this.id.equals(other.id))) {
            return false;
        }

        if ((this.nome == null)
            ? (other.nome != null)
            : !this.nome.equals(other.nome)) {
            return false;
        }

        if ((this.dataNascimento != other.dataNascimento)
                && ((this.dataNascimento == null) ||!this.dataNascimento.equals(other.dataNascimento))) {
            return false;
        }

        if ((this.nomeMae == null)
            ? (other.nomeMae != null)
            : !this.nomeMae.equals(other.nomeMae)) {
            return false;
        }

        if ((this.nomePai == null)
            ? (other.nomePai != null)
            : !this.nomePai.equals(other.nomePai)) {
            return false;
        }

        return true;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
