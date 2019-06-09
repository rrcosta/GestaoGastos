# Gestao de Gastos

Projeto para gestao de Gastos

### Procedimentos que deverá efetuar para subir o ambiente
### Instalação e execução da aplicação

1. Faça o clone deste projeto

2. Vá ao diretório do projeto e execute

        $ bundle install

3. Copie o conteúdo do arquivo .env.example para o arquivo .env e altere com as credenciais de seu ambiente local

        $ cp .env.example .env

4. Abra o arquivo .env e coloque os seus dados de acesso do seu banco de dados Postgrsql


5. Faça o setup do banco de dados: Criação do Banco de Dados

        $ bin/rails db:create

6. Faça o setup do banco de dados: Criação das tabelas Banco de Dados

        $ bin/rails db:migrate

7. Inicie a aplicação usando o servidor local (Irá iniciar na porta padrão que é a 3000)

        $ rails s
