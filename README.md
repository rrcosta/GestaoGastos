# Gestao de Gastos

Projeto para gestao de Gastos

### Procedimentos que deverá efetuar para subir o ambiente
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
    "password_digest": "$2a$10$CIYnpAox9X/ERyGSzJ0Ster/mD0JQKMx/yfjZtYgE7gwzyeKtIiwC",
    "created_at": "2019-06-09T23:52:01.683Z",
    "updated_at": "2019-06-09T23:52:01.683Z"
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
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiZGMwZTcyYTAtMzNmMy00MGUxLWFhZTgtNjY4NDhiNjNmMTIzIiwiZXhwIjoxNTYwMjExMjc1fQ.kqZMHOmELv2Sl7rRw8MqBG5UOF1QfN7yPj4gpCFL26s",
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
        "password_digest": "$2a$10$CIYnpAox9X/ERyGSzJ0Ster/mD0JQKMx/yfjZtYgE7gwzyeKtIiwC",
        "created_at": "2019-06-09T23:52:01.683Z",
        "updated_at": "2019-06-09T23:52:01.683Z"
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
        "user_id": "dc0e72a0-33f3-40e1-aae8-66848b63f123",
        "created_at": "2019-06-14T14:06:15.051Z",
        "updated_at": "2019-06-14T14:06:15.051Z"
    },
    {
        "id": "b741547d-8412-4a6b-adee-8279cdc48250",
        "descricao": "Pagamento da parcela do carro ",
        "valor": "652.75",
        "data": "2019-06-12T00:00:00.000Z",
        "user_id": "dc0e72a0-33f3-40e1-aae8-66848b63f123",
        "created_at": "2019-06-14T14:05:33.804Z",
        "updated_at": "2019-06-14T14:05:33.804Z"
    },
    {
        "id": "8e397385-98df-484c-a737-b71454766222",
        "descricao": "teste",
        "valor": "1250.1",
        "data": "2019-06-13T00:00:00.000Z",
        "user_id": "dc0e72a0-33f3-40e1-aae8-66848b63f123",
        "created_at": "2019-06-13T14:04:38.059Z",
        "updated_at": "2019-06-13T14:04:38.059Z"
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
        "user_id": "dc0e72a0-33f3-40e1-aae8-66848b63f123",
        "created_at": "2019-06-14T14:06:15.051Z",
        "updated_at": "2019-06-14T14:06:15.051Z"
    }
  ]
```

..

