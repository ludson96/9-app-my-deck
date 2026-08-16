# My Deck App

> Um aplicativo prático e intuitivo para criação, gerenciamento e revisão de estudos utilizando flashcards.

## 📝 Sobre o Projeto
O **My Deck** é um aplicativo mobile focado em facilitar o aprendizado através de flashcards. Desenvolvido em Flutter, ele permite aos usuários criar, organizar e gerenciar seus próprios "decks" de estudo. É uma ferramenta simples e eficiente, ideal para acelerar a memorização de conteúdos diversos, sejam idiomas, matérias escolares ou preparação para provas.

## 🖼️ Tela (Preview)

<img src="assets/my-deck.gif" alt="Demonstração do App" width="300"/>

## ✨ Funcionalidades

- 🔐 **Autenticação Segura**: Sistema de criação de conta e login para proteger os dados do usuário.
- 🗂️ **Gerenciamento de Decks**: Crie, visualize, edite e remova seus decks de estudo de forma intuitiva.
- 🃏 **Criação de Cartões (Flashcards)**: Adicione e gerencie perguntas e respostas dentro de cada deck.
- 🧠 **Modo Quiz / Estudo**: Teste seus conhecimentos respondendo às questões dos decks criados.

## 🛠️ Tecnologias e Arquitetura

O projeto foi construído com foco em qualidade, escalabilidade e manutenibilidade, utilizando as seguintes tecnologias e padrões:

**Core & UI**
- **[Flutter](https://flutter.dev/) & [Dart](https://dart.dev/)**: Framework e linguagem base do projeto.
- **Material Design**: Componentes visuais padrão do Flutter.

**Arquitetura & Estado**
- **Feature-Based Architecture**: Organização estrutural por módulos (`authentication`, `decks`, `quiz`), onde cada feature possui suas próprias camadas de View, Store e Service.
- **[MobX](https://mobx.pub/)**: Gerenciamento de estado reativo, simples e previsível.
- **[GetIt](https://pub.dev/packages/get_it)**: Localizador de serviços (Service Locator) para Injeção de Dependências (DI).

**Dados & Rede**
- **[Dio](https://pub.dev/packages/dio)**: Cliente HTTP robusto para comunicação com a API.
- **[Shared Preferences](https://pub.dev/packages/shared_preferences)**: Armazenamento local leve, utilizado para persistir o token de sessão do usuário.

**Testes & Ferramentas**
- **Testes Automatizados**: Testes de unidade e integração utilizando o `flutter_test`.
- **[Mocktail](https://pub.dev/packages/mocktail)**: Biblioteca para criação de mocks nas suítes de teste de forma eficaz.
- **Code Generation**: Geração de código automatizada com `build_runner` e `mobx_codegen` para otimizar o desenvolvimento com MobX.

## 🚀 Como Executar o Projeto

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/ludson96/9-app-my-deck.git

    cd 9-app-my-deck
    ```

2.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```

3.  **Execute o aplicativo:**
    ```bash
    flutter run
    ```

## 🧪 Como Executar os Testes

Para garantir a qualidade e o funcionamento correto de todas as partes da aplicação, execute o seguinte comando:

```bash
flutter test
```
