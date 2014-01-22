package util.decorator;

import util.base.IConfiguracao;


public abstract class ConfiguracaoDecorator implements IConfiguracao{

	protected IConfiguracao configuracao;
	
	public ConfiguracaoDecorator(IConfiguracao config){
		this.configuracao = config;
	}
	
}
