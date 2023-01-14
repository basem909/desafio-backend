# Projeto

O projeto é responsável pelas Campanhas de Email Marketing. Existem apenas duas entidades: `campaign` e `campaign_state`. A entidade `campaign` representa as campanhas de Email Marketing, já a entidade `campaign_state` é o histórico de estados da campanha, onde o último registro da entidade representa o **estado atual** da campanha.

### Exemplo de como funciona uma campanha

- Campanhas são criadas para enviar emails marketing a uma lista de contatos
- Novas campanhas criadas iniciam no estado `draft`
- Ao Agendar o envio da campanha adicionamos um novo estado: `scheduled`
- Quando chegar a data agendada, processamos a campanha executando diversas rotinas como: substituição das variáveis de template, validação dos destinatários, entre outros. Durante este processamento o estado é `processing`
- Após processar, é hora de enviar os emails, o estado é `sending`
- Ao enviar todos os emails da campanha finalizamos com o estado `completed`.

## Como executar o projeto

O projeto está configurado e pode ser executado com [Docker](https://www.docker.com/).

- Acesse a diretório do projeto via terminal
- Execute o comando: `make docker`
- Após finalizar a criação dos containers, execute: `make bash` para acessar o terminal do container
- e por último execute o comando: `rails db:create db:setup db:seed`

# Desafio

O desafio é composto por três problemas que precisam ser implementados e testados, é permitido utilizar qualquer dependência para os testes, como o Rspec e Minitest, ou outra.

## Desafio 1: Implementar o método `find_last_completed_campaign`

Implementar a consulta para obter a última campanha concluída, ou seja, a última campanha que passou para o estado `completed`.

**Resultado:** Considerando os valores do banco definidos no seed, ao executar este método o valor retornado é:

- A campanha com nome `Campaign EA`

## Desafio 2: Implementar o método `list_campaigns_by_state`

Implementar a consulta para listar todas as campanhas pelo estado informado. Exemplo: ao executar o método `Campaign.list_campaigns_by_state(:draft)` deve retornar todas as campanhas cujo estado atual é `draft`.

Obs: Veja a lista de estados no modelo `CampaignState`.

**Resultado:** Considerando os valores do banco definidos no seed, os resultados esperados de acordo com o estado:

- Draft:       `["Campaign A", "Campaign AB", "Campaign AC"]`
- Scheduled:   `["Campaign B"]`
- Processing:  `["Campaign C", "Campaign CA"]`
- Sending:     `["Campaign D"]`
- Completed:   `["Campaign E", "Campaign EA"]`
- Error:       `["Campaign F"]`

## Desafio 3: Implementar o método `total_campaigns_by_state`

Implementar a consulta para listar o total de campanhas por estado considerando somente o **estado atual** da campanha, por exemplo: no cenário onde a campanha X possui os estados `:draft` e `:scheduled`, o resultado será: `[{draft: 0, scheduled: 1, ... }]`.

**Resultado:** Considerando os valores do banco definidos no seed, o resultado esperado de acordo com o estado:

```ruby
[
  { campaigns: 3, state: 'draft' },
  { campaigns: 1, state: 'scheduled' },
  { campaigns: 2, state: 'processing' },
  { campaigns: 1, state: 'sending' },
  { campaigns: 2, state: 'completed' },
  { campaigns: 1, state: 'error' }
]
```
# Documentação de solução
- mostra de code:

https://www.loom.com/share/9b8174df0f5c483d91935f9d6d46513f

- mostra de resultado do api no Postman:

https://www.loom.com/share/b582aa255d5e45aaa3652112210afb74
