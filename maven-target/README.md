maven-target
=================

Instruções para gerar o war:

<pre>
	mvn clean package -Dregional=&lt;go|rj&gt; -Destagio=&lt;dev|prd&gt;
</pre>

Onde: 
<dl>
  <dd><b>regional -></b> Para qual regional deve ser gerado o war</dd>
  <dd><b>estagio -></b> dev para desenvolvimento ou prd para produção.</dd>
</dl>
