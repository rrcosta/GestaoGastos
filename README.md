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
### Carga Primária para utilizar o sistema

Para utilizar esta API é necessário criar os seguintes passos:

1. Criar um usuário, atraves do endpoint POST /users, exemplo:
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


2. Autenticar na API, atraves do endpoint POST /auth/login, exemplo:
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

  Header
  
 
|               |                           |
|---------------|---------------------------|
| Authorization | eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiZGMwZTcyYTAtMzNmMy00MGUxLWFhZTgtNjY4NDhiNjNmMTIzIiwiZXhwIjoxNTYwMjExMjc1fQ |
|               |                           |
 

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
 
