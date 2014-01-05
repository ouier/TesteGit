package sp.rafael.estudocdi.business;

import sp.rafael.estudocdi.dao.PessoaDao;
import sp.rafael.estudocdi.model.Pessoa;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by Rafael on 05/01/14.
 */
public class PessoaBO {


    @Inject
    private PessoaDao pessoaDao;

    public List<Pessoa> listarPessoas(){
        return  pessoaDao.findAll();
    }
}
