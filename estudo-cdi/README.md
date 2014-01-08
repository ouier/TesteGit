estudo-cdi
=============================

Projeto utilizado para estudos em CDI

Artefatos utilizados
---------------------------------

<ul>
    <li>maven</li>
    <li>jboss</li>
    <li>arquillian, drone(graphene 2)</li>
    <li>selenium server</li>
</ul>

Instruções
-----------------------

Testar:

        mvn clean test -parquillian-container-managed


Observações
------------------------------

É necessário baixar o selenium server [[http://docs.seleniumhq.org/download/]]

É necessário rodar o selenium server:

    java -jar selenium-server-standalone-2.39.0.jar

É necessário configurar o arquivo src/test/resources/arquillian.xml