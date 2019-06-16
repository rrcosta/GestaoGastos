# Gestao de Gastos

Projeto para gestao de Gastos

### Procedimentos que deverá efetuar para subir o ambiente

Na implementaçao deste projeto foi utilizado o seguinte stack tecnologico: Git, Ruby, Rails, PostgreSql.

## Ambiente de desenvolvimento

### Pre Requirements
* Linux / Mac OSX
* [Git](https://git-scm.com)
* [Ruby 2.6.3](https://www.ruby-lang.org)
* [Rails 6.0.0.rc1](https://www.ruby-lang.org)
* [Bundler gem](https://github.com/bundler/bundler)

### Instalações dos pré-requisitos

* Git

O primeiro passo que deverá efetuar será instalar o Git (https://git-scm.com), caso ainda não o tenha.
Vide estes tutoriais para instalação:

  https://git-scm.com/book/pt-br/v1/Primeiros-passos-Instalando-Git
  https://www.liquidweb.com/kb/install-git-ubuntu-16-04-lts/


Após a instalação do git, deverá configura-lo (https://git-scm.com/book/pt-br/v2/Começando-Configuração-Inicial-do-Git) e dar clonar (https://git-scm.com/book/pt-br/v2/Git-Basics-Getting-a-Git-Repository) o seguinte repositório: (git@github.com:rrcosta/api-intelipost.git), após clona-lo deverá seguinte os passos abaixo

* Ruby

Para obter a versão 2.6.3 do Ruby, basta abrir um terminal em seu sistema e digitar um dos seguintes comandos:

Para: Mac

  Para maiores detalhes vide: http://railsapps.github.io/installrubyonrails-mac.html

  ```
  brew install ruby
  ```

  Para: Linux (Debian, Ubuntu e derivados)

  ```
  sudo apt-get install ruby-full
  ```

Para: Windows

  Para instalar o Ruby no Windows, sugiro verificar os passos no seguinte site: https://rubyinstaller.org/downloads/ 


* Ruby on Rails

Após instalar o ruby (passo acima), deverá instalar o framework Rails, através do comando abaixo

  ```
  gem install rails
  ```
  Obs: dependendo das configurações de sua maquina, este processo poderá demorar, mas não se preoucupe esse é o único passo que poderá demorar um pouco ;)

* PostgreSQL

Para instalação do Postgresql, entre neste tutorial e mande brasa na instação de um dos melhores BD gratuidos para se trabalhar!

https://www.edivaldobrito.com.br/como-instalar-o-postgresql-9-4-no-ubuntu-e-centos/


### Instalação e execução da aplicação

1. Faça o clone deste projeto

2. Vá ao diretório do projeto e execute
  ```bash
          $ bundle install
  ```

3. Copie o conteúdo do arquivo .env.example para o arquivo .env e altere com as credenciais de seu ambiente local
  ```bash
      $ cp .env.example .env
  ```

4. Abra o arquivo .env e coloque os seus dados de acesso do seu banco de dados Postgrsql

5. Faça o setup do banco de dados: Criação do Banco de Dados
  ```bash
      $ bin/rails db:create
  ```

6. Faça o setup do banco de dados: Criação das tabelas Banco de Dados
  ```bash
      $ bin/rails db:migrate
  ```

7. Inicie a aplicação usando o servidor local (Irá iniciar na porta padrão que é a 3000)
  ```bash
      $ rails s
  ```

### Rodar os testes da aplicação

Para rodar os testes automatizados deste projeto, basta entrar no pasta raiz do projeto e digitar:

  ```bash
      $ rspec
  ```

### Autenticaçao da aplicação

Para a autenticaçao foi utilizado o JWT, que e um padrao (RFC-7519) de mercado que define como transmitir e armazenar objetos JSON de forma segura.

Ele e formado por 3 secoes: Header, Payload e Signature.


### Carga Primária para utilizar o sistema

#### Usuario (User)

Para utilizar esta API é necessário fazer os seguintes passos:

1. Criar um usuário, atraves do endpoint:

```ruby
    POST /users
```

```ruby
   {
	 "name": "teste",
	 "username": "teste",
	 "password": "123456",
	 "password_confirmation": "123456"
   }
```

response

  ```ruby
    {
      "id": "dc0e72a0-33f3-40e1-aae8-66848b63f123",
      "name": "teste",
      "username": "teste",
      "password_digest": "$2a$10$CIYnpAox9X/ERyGSzJ0Ster/mD0JQKMx/yfjZtYgE7gwzyeKtIiwC"
    }
  ```

2. Autenticar na API, atraves do endpoint:

  ```ruby
    POST /auth/login
  ```

  ```ruby
    {
    "username": "teste",
    "password": "123456"
    }
  ```
  response:

  ```ruby
    {
      "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiZGMwZTcyYTAtMzNmMy00MGUxLWFhZTgtNjY4NDhiNjNmMTIzIiwiZXhwIjoxNTYwMjExMjc1fQ",
      "exp": "10-06-2019 21:01",
      "username": "teste"
    }
  ```
3. Efetuar o Login na API com o cabeçalho - Authorization com o token.

  ```ruby
    GET /users/{username}
    
    GET /users/teste
  ```

header
  
    |---------------|-----------------------------------------------------------------------------------------------------------------------|
    | Authorization |Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiZGMwZTcyYTAtMzNmMy00MGUxLWFhZTgtNjY4NDhiNjNmMTIzIiwiZXhwIjoxNTYwMjExMjc1fQ |
    |---------------|-----------------------------------------------------------------------------------------------------------------------|


  Response:
  ```ruby
    [
      {
          "id": "dc0e72a0-33f3-40e1-aae8-66848b63f123",
          "name": "teste",
          "username": "teste",
          "password_digest": "$2a$10$CIYnpAox9X/ERyGSzJ0Ster/mD0JQKMx/yfjZtYgE7gwzyeKtIiwC"
      }
    ]
  ```

OBS: Sempre sera necessario passar o token para acessar e manipular as informacoes na API.

#### Gastos (expenses)

O usuario poderar cadastrar seus gastos atraves do endpoint:

```ruby
    POST /expenses
```

header
  
    |---------------|-----------------------------------------------------------------------------------------------------------------------|
    | Authorization |Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiZGMwZTcyYTAtMzNmMy00MGUxLWFhZTgtNjY4NDhiNjNmMTIzIiwiZXhwIjoxNTYwMjExMjc1fQ |
    |---------------|-----------------------------------------------------------------------------------------------------------------------|

body
```ruby
  {
    "descricao": "teste",
    "valor": 1250.10,
    "data": "2019-06-13"
  }
```

OBS: O campo "codigousuario" informado no teste sera considerado como "user_id", que sera obtido ao salvar o registro de gasto (expense), atraves do token informado no client (Postman, SoapUI ou Curl ).

Visualizar os gastos cadastrados pelo usuário logado na api:

```ruby
    GET /expenses
```

header
  
    |---------------|-----------------------------------------------------------------------------------------------------------------------|
    | Authorization |Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiZGMwZTcyYTAtMzNmMy00MGUxLWFhZTgtNjY4NDhiNjNmMTIzIiwiZXhwIjoxNTYwMjExMjc1fQ |
    |---------------|-----------------------------------------------------------------------------------------------------------------------|

```ruby
  [
    {
        "id": "e30b2dab-05ce-4eb9-9502-fe747fc4be72",
        "descricao": "Pagamento do condominio ",
        "valor": "305.95",
        "data": "2019-06-03T00:00:00.000Z",
        "category": []
    },
    {
        "id": "b741547d-8412-4a6b-adee-8279cdc48250",
        "descricao": "Pagamento da parcela do carro ",
        "valor": "652.75",
        "data": "2019-06-12T00:00:00.000Z",
        "category": []
    },
    {
        "id": "8e397385-98df-484c-a737-b71454766222",
        "descricao": "teste",
        "valor": "1250.1",
        "data": "2019-06-13T00:00:00.000Z",
        "category": []
    }
]
```

### Filtro de Gastos por dia.

  A Api disponibiliza um endpoint de filtro para buscar os gasto de um determinado dia cadastrado pelo usuário logado na api.
  
  exemplo:
  
  ```ruby

    GET /gasto_por_dia?data=2019-06-03

  ```
  Onde o data=2019-06-03 deverá ser a data desejada para fazer o filtro de gastos cadatrados através do usuário logado pelo Token.
  

  header

    |---------------|-----------------------------------------------------------------------------------------------------------------------|
    | Authorization |Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiZGMwZTcyYTAtMzNmMy00MGUxLWFhZTgtNjY4NDhiNjNmMTIzIiwiZXhwIjoxNTYwMjExMjc1fQ |
    |---------------|-----------------------------------------------------------------------------------------------------------------------|

  Response:

  ```ruby
  [
    {
        "id": "e30b2dab-05ce-4eb9-9502-fe747fc4be72",
        "descricao": "Pagamento do condominio ",
        "valor": "305.95",
        "data": "2019-06-03T00:00:00.000Z",
        "category": []
    }
  ]
  ```
### Categorias

#### Para cadastrar uma categoria basta fazer seguinte:

A Api disponibiliza um endpoint de criaçao de categorias por cada gasto cadastrado pelo usuario logado na api.

Acessar o detalhes do gasto desejado e utilizar POST /{id-do-gasto}/categoria.

Exemplo:
  ```ruby
    POST /expenses/e30b2dab-05ce-4eb9-9502-fe747fc4be7/categoria
  ```
  onde "e30b2dab-05ce-4eb9-9502-fe747fc4be7" sera o ui do gasto em que o usuario deseja adicionar a categoria
 
  header

    |---------------|-----------------------------------------------------------------------------------------------------------------------|
    | Authorization |Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiZGMwZTcyYTAtMzNmMy00MGUxLWFhZTgtNjY4NDhiNjNmMTIzIiwiZXhwIjoxNTYwMjExMjc1fQ |
    |---------------|-----------------------------------------------------------------------------------------------------------------------|

  body

  ```ruby
  {
    "descricao": "Lazer"
  }
  ```

  responder

  ```ruby
  {
    "id": "d31dcc50-084a-4540-a9a4-699dfe7dd3b2",
    "descricao": "Lazer",
    "expense": {
        "id": "e30b2dab-05ce-4eb9-9502-fe747fc4be7"
    }
  }
  
  ```

  #### Para Verificar as já categorias já existentes:

  A Api disponibiliza um endpoint para listar todas as categorias cadastradas na api.

  <b>OBS¹</b>: É listado todas as categorias cadastradas na api, independentemente do usuario logado.

  Exemplo:

  ```ruby
    GET /categories
  ```
  header

    |---------------|-----------------------------------------------------------------------------------------------------------------------|
    | Authorization |Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiZGMwZTcyYTAtMzNmMy00MGUxLWFhZTgtNjY4NDhiNjNmMTIzIiwiZXhwIjoxNTYwMjExMjc1fQ |
    |---------------|-----------------------------------------------------------------------------------------------------------------------|

  
  responder

  ```ruby
  [
    {
        "id": "b06be318-de6d-4132-8f9f-7adedacb3986",
        "descricao": "teste",
        "expense": {
            "id": "cc337360-2255-46b3-aabc-649918291c4f"
        }
    },
    {
        "id": "d31dcc50-084a-4540-a9a4-699dfe7dd3b2",
        "descricao": "Lazer",
        "expense": {
            "id": "e30b2dab-05ce-4eb9-9502-fe747fc4be7"
        }
    }
  ]
  ```

  <b>OBS²</b> Conforme visto acima, no responder é indicado qual ID do gasto que esta vinculado a categoria(as)

..

