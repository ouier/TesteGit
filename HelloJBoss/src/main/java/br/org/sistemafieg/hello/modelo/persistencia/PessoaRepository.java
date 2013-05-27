package br.org.sistemafieg.hello.modelo.persistencia;

import org.springframework.data.jpa.repository.JpaRepository;

import br.org.sistemafieg.hello.modelo.to.Pessoa;

public interface PessoaRepository extends JpaRepository<Pessoa, Integer> {

}
