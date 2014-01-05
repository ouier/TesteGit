package sp.rafael.estudocdi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by Rafael on 05/01/14.
 */
@Entity
@Table(name="EST_PESSOA")
public class Pessoa extends BaseEntity<Long>{

    private String nome;
    private Date dataNascimento;

    @OneToMany(mappedBy = "pessoa")
    public List<Endereco> getEnderecos() {
        return enderecos;
    }

    public void setEnderecos(List<Endereco> enderecos) {
        this.enderecos = enderecos;
    }

    private List<Endereco> enderecos;

    @Column(name="NOME")
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Column(name="DATA_NASC")
    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }
}
