package util;

import util.base.IConfiguracao;
import util.decorator.ConfiguracaoDecorator;

public class Configuracao extends ConfiguracaoDecorator{

	public Configuracao(IConfiguracao config) {
		super(config);
	}

	public String getRegional() {
		return "RJ";
	}

	public String getSMTP() {
		return "smtp.sistemafirjan.org.br";
	}
}