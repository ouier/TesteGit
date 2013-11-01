maven-target
=================

Instruções para gerar o war:

<pre>
	mvn clean package -Dregional=<go|rj> -Destagio<dev|prd>
</pre>

Onde: 
	regional = Para qual regional deve ser gerado o war
	estagio  = dev para desenvolvimento ou prd para produção.


