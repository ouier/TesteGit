package util;

import util.base.IConfiguracao;
import util.decorator.ConfiguracaoDecorator;


public class Configuracao extends ConfiguracaoDecorator{

	public Configuracao(IConfiguracao config) {
		super(config);
	}

	public String getRegional() {
		return "GO";
	}

	public String getSMTP() {
		return "smtp.sistemafieg.org.br";
	}
}
