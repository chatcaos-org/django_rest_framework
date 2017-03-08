Django Rest Framework

Bom, começando tudo para entendermos REST precisamos entender o Hipertexto

Se trata de um documento que contém links para outros documentos, um link permite que eu referencie arquivos externos ou complementares, à informação descrita no hipertexto, similar ao funcionamento de uma sinapse.

ESSA É A BASE... segure esse conceito ae!

Com a internet, temos documentos que são hospedados em dominios e acessados via protocolo HTTP (HiperText Transfer Protocol), um mecanismo de request-reponse no modelo client server tradicional.

Durante muito tempo utilizamos os métodos get e post de forma incorreta, ou por restrições tecnologicas ou por falta de entendimento da especificação, o que causou implicações no modo em que pensavamos a arquitetura de nossas aplicações. Durante muito tempo criamos sites que eram um sistema monolitico e sofremos terrivelmente para torná-los escaláveis e construir produtos razoavelmente fáceis de manter.

Éis que um conjunto de fatores nos fez olhar para o paper de Roy Felding em que ele demonstrava a forma correta de se trabalhar com troca de informações mediante o procolo http.

REpresentational State Transfer

Perceba que a proposta é ter servidores de estado de recursos. se analisarmos para o conceito do hipertexto entendemos perfeitamente o que ele quer dizer. Pois a base está em dispor recursos identificados por suas URIs e permitindo que através dos links eu navegue pelos recursos e pelas possíveis mudanças de estado.

Então podemos pensar em uma loja virtual como um provedor de recursos em que eu posso acessar o recurso http://loja.com/produto/informatica/1 e isso me permite ver o teclado e permite que eu possa criar meu carrinho de compras http://loja.com/carrinho/1, adicionar produtos ao meu carrinho e em seguida permite que eu finalize minha compra http://loja.com/carrinho/1/finalizar.


É importante notar que um usuário será guiado pelas paginas html que mostram em linguagem humana como navegar por todos estes links, porém uma maquina pode facilmente ser programada para acessar todas essas uris e assim facilitar uma integração entre fornecedores e a loja.



https://en.wikipedia.org/wiki/Hypertext
https://www.ietf.org/rfc/rfc2616.txt
https://pt.wikipedia.org/wiki/Hypertext_Transfer_Protocol
http://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm

Django rest framework

Projeto open source mantido pela comunidade pelas informações de seu repositório no github o projeto está ativo desde 2010
Basicamente utiliza mais dois projeto Markdown e django-filter.

Neste screen cast além tecnologias adjacentes que auxiliam na criação deste ambiente de teste. 

Vamos entender qual é a alternativa para construção de uma api rest com django em python.

Como dito anteriormente utilizaremos o framework Django rest framework


Partindo do principio que temos a necessidade de expor uma coleção de dados sob http e decidimos pela melhor opção e vamos implementar uma api rest.

Utilizaremos as três principais classes para tal:
 - FilterSet;
 - Serializer;
 - Viewset;

Com esta estrutura sob uma aplicação django, vamos conseguir expor nossa API de forma segura e aderente ao padrão REST.

Primeiro passo

Configuração do settings. OK
Montar Modelo. OK
Montar Serializer
Montar View
Montar Route

Django-filter que nada... 
https://github.com/philipn/django-rest-framework-filters



colinha:
docker run -d -p 5432:5432 -p 8000:8000 -v /home/claudio/projects/csantos/django_rest_framework/src:/src_code --name hdson_rest hdson_rest
docker exec --user root -it hdson_rest bash