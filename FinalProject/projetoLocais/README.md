# Implementação Projeto - Locais

## Índice

1. [Objetivo do Projeto](#objetivo-do-projeto)
2. [Tipos de Utilizadores](#tipos-de-utilizadores)
3. [Funcionalidades da Aplicação](#funcionalidades-da-aplicação)
4. [Funcionalidades para Utilizadores Registados](#funcionalidades-para-utilizadores-registados)
5. [Estrutura do Projeto](#estrutura-do-projeto)
6. [Pacotes Necessários](#pacotes-necessários)
7. [Configurações do Web.config](#configurações-do-webconfig)
8. [Global Application Class](#global-application-class)
9. [Arquitetura da Aplicação](#arquitetura-da-aplicação)
10. [Área Pessoal do Utilizador](#área-pessoal-do-utilizador)
11. [Formulários](#formulários)
12. [Validações](#validações)
13. [Eventos e Manipulação](#eventos-e-manipulação)
14. [Segurança](#segurança)
15. [Aldeias e Locais – Criação de Locais](#aldeias-e-locais--criação-de-locais)

---

## Objetivo do Projeto

- **Criação de um portal web para divulgação de informações sobre aldeias e locais históricos em Portugal.**

## Tipos de Utilizadores

- **Anónimos:** Podem visualizar informações e criar conta.
- **Utilizadores Autenticados:** Podem publicar informações, comentar e classificar locais.

## Funcionalidades da Aplicação

- **Página Inicial:** Lista de locais publicados, redirecionamento para detalhes do local.
- **Web Form para Local:** Informações detalhadas sobre o local, incluindo fotos e comentários.
- **Classificação:** Exibição dos dez locais com melhor classificação.

## Funcionalidades para Utilizadores Registados

- **Criar Local:** Definição de nome, descrição, morada, localidade, distrito/concelho e fotos.
- **Alterar Local:** Edição de informações e gestão de fotos.
- **Editar Dados Pessoais:** Alteração de nome e e-mail.

## Estrutura do Projeto

- **Base de Dados:** Criação da base de dados usando SQL Server Management Studio.
- **ASP.NET Web Application:** Criação de um projeto vazio sem HTTPS.
- **Pastas do Projeto:**
  - **utilizador:** Formulários para criação/edição de dados.
  - **imagens:** Armazenamento de imagens dos locais.

## Pacotes Necessários

- **ASP.NET Universal Providers:** Para autenticação.
- **jQuery:** Para manipulação de DOM.
- **Bootstrap:** Para design responsivo.

## Configurações do Web.config

- **Definição do tipo de autenticação.**
- **Regras de acesso para formulários.**

## Global Application Class

- **Configuração do Application_Start() para mapeamento de recursos jQuery.**

## Arquitetura da Aplicação

- **Exibição de locais em um controle DataList.**
- **Gestão de sessão para armazenar ID do utilizador.**

## Área Pessoal do Utilizador

- **Listagem de locais inseridos pelo utilizador em um GridView.**
- **Opções para criar e editar locais.**

## Formulários

- **Criar Conta:** Formulário para registro de novos utilizadores.
- **Login:** Formulário para autenticação de utilizadores.
- **Área Pessoal:** Formulário para gestão de locais do utilizador.
- **Criar Local:** Formulário para adicionar novos locais.
- **Editar Local:** Formulário para modificar locais existentes.

## Validações

- **Validação de campos obrigatórios, e-mail e idade mínima (18 anos).**

## Eventos e Manipulação

- **Eventos de clique para criação de conta e login.**
- **Manipulação de dados no banco de dados.**

## Segurança

- **Configuração de regras de acesso para pastas específicas.**

---

## Aldeias e Locais – Criação de Locais

### Projeto: Aldeias e Locais Históricos de Portugal

- **Criação e edição de dados de um local.**

### Criação do Web Form

- **Adicionar um controlo do tipo DataList em areaPessoal.aspx para mostrar a lista de locais criados pelo utilizador.**

### Stored Procedure: GetLocaisByUtilizador

- **Criação da Stored Procedure para obter locais por utilizador.**
- **Recebe o ID do utilizador da variável de sessão.**

### Definição do DataList

- **Estrutura do DataList para exibir locais com imagens e detalhes.**

### Carregamento de Locais

- **Método CarregarLocais() para preencher o DataList utilizando a Stored Procedure.**

### Redirecionamento para Criar Local

- **Implementação do botão "Criar local" que redireciona para criarLocal.aspx.**

### Formulário criarLocal.aspx

- **Adição de controlos para definir nome, descrição, morada, localidade, distrito, latitude e longitude.**
- **Implementação de um controlo FileUpload para fotos.**

### Definição de Distrito e Concelho

- **Utilização de DropDownList para selecionar distrito e concelho, com preenchimento dinâmico.**

### Stored Procedure: LocalCriar

- **Criação da Stored Procedure para inserir um novo local na tabela Local.**

### Obtenção de Latitude e Longitude

- **Utilização da API positionstack.com para obter coordenadas geográficas.**

### DataList para Fotos

- **Definição de um DataList para mostrar fotos associadas ao local.**

### Método GetFotosLocal

- **Método para preencher o DataList com fotos de um local específico.**

### Stored Procedure: LocalFotoCriar

- **Criação da Stored Procedure para inserir fotos na tabela Foto.**

### Validação de Upload de Fotos

- **Verificação do tipo de ficheiro antes de realizar o upload.**

### Seleção e Edição de Fotos

- **Implementação de funcionalidades para selecionar, editar e eliminar fotos.**

### Cancelamento de Ações

- **Implementação de botões de cancelamento para limpar controlos e remover dados.**

### Stored Procedure: LocalEliminar

- **Criação da Stored Procedure para eliminar um local e suas fotos.**

### Eliminação de Dados

- **Implementação da lógica para eliminar dados e arquivos associados ao local.**
