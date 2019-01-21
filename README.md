# vending-machine-graphql

Lab de uma API com GraphQL

---

## Para funcionar

O projeto é um rails-api simples com o GraphiQL para navegar e testar o schema:

```bash
rails s
```

Acessar _localhost:3000/graphql_ para ver as coisas.

---

Esse lab tem como objetivo ser um estudo de uma API com GraphQL que atenda dois critérios:

- controle estilo hypermedia, no qual a API consegue dizer quais funcionalidades estão disponíveis sem que clientes precisem inferir estado
- mutations com erros mais fáceis de usar que o atributo na raiz da resposta

## Hypermedia

Não é possível guiar diretamente o uso dos recursos via GraphQL como com hypermedia, por exemplo colocando um link _buy_ nos itens disponíveis mas não nos esgotados, porém é possível identificar de duas maneiras quais itens podem ser comprados:

1. o tipo do item (_\_\_typename_) é a principal indicação de como lidar com o item, e
2. o preço só está disponível em itens que podem ser comprados e é um atributo não-nulo, então clientes que não diferenciarem os dois tipos de item terão que lidar com um atributo ausente em alguns casos, que é um sintoma de lutar contra o paradigma ao invés de usá-lo.

Essas duas abordagens usam os tipos do GraphQL para guia o uso e, assim como com hypermedia, é esperado que uma documentação ajude a entender como deve ser desenvolvido um cliente e os dados em tempo de execução consigam pilotar a aplicação. Afinal, a existência de um link _buy_ só faz aparecer um botão e fazer a chamada necessário caso exista código para isso.

Discriminar funcionalidades pelo tipo do recurso (1) só faz sentido se existe uma distinção muito óbvia das funcionalidades, no caso da máquina de vendas a possibilidade de compra é praticamente a única coisa relevante no item, então faz sentido os dois tipos. Mas no caso geral um atributo é suficiente para indicar uma funcionalidade, por exemplo _canBeBought_ se o item pode ser comprado; e isso também funciona para coisas menos relevantes, por exemplo um item promocional que só pode ser comprado com um cartão especial, ao invés de ter um tipo _SpecialItem_ (ou sendo mais específico _SpecialAvailableItem_ e _SpecialSoldoutItem_), basta um atributo _requiresPromoCard_ para os clientes em máquinas participantes da promoção possam validar o pagamento correto.

Acredito que é possível aplicar as ideias de hypermedia com GraphQL mas é preciso entender a diferença da implementação: uma API hypermedia assume que clientes sabe como usar os recursos e o que fazer com cada link, desde o método (GET, POST) até o formato do payload, e dirige a aplicação disponibilizando ou não links e também a URL para que os clientes não precisem conhecê-las. Já a API GraphQL pode assumir com um pouco mais certeza que clientes sabem usar os recursos por causa dos tipos e só pode dirigir a aplicação via atributos (ou tipos), que faz sentido porque clientes que podem lidar com uma certa funcionalidade precisam saber em quais condições está disponível, mas não precisa divulgar uma localização porque já é conhecida. Enfim, para variar comportamento com hypermedia é preciso uma informação da API: o link, e com GraphQL é preciso uma informação: a disponibilidade.

## Erros

GraphQL especifica um atributo na raiz para os erros, porém não proíbe que os erros sejam expressos nos tipos, isso permite uma abordagem mais comum de retornar tipos diferentes para sucesso e erro, cada um podendo ter diferentes atributos que melhor representem o resultado.
