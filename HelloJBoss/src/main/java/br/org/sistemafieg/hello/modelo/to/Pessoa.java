package br.org.sistemafieg.hello.modelo.to;

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

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="PESSOA")
@Data(staticConstructor="of") @AllArgsConstructor @NoArgsConstructor
@SuppressWarnings("all")
public class Pessoa implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ID_PESSOA")
	private Integer id;
	
	@Column(name="PES_NOME")
	private String nome;
	
	@Temporal(value=TemporalType.DATE)
	@Column(name="PES_DATA_NASCIMENTO")
	private Date dataNascimento;
	
}
