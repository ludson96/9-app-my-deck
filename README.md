# My Deck App

O **My Deck** é um aplicativo mobile desenvolvido em Flutter que permite aos usuários criar e gerenciar "decks" de estudo, similar a um sistema de flashcards. É uma ferramenta ideal para memorização e aprendizado de novos conteúdos.

## ✨ Funcionalidades

- **Autenticação de Usuários**: Sistema seguro de criação de conta e login.
- **Criação de Decks**: Crie novos decks de estudo com títulos personalizados.
- **Gerenciamento de Decks**: Visualize, atualize e delete seus decks.
- **Adição de Cartas (Questões)**: Adicione perguntas e respostas a cada deck para facilitar o estudo.

## 🛠️ Tecnologias e Arquitetura

O projeto foi construído com foco em qualidade, escalabilidade e manutenibilidade, utilizando as seguintes tecnologias e padrões:

- **Linguagem**: [Dart](https://dart.dev/)
- **Framework**: [Flutter](https://flutter.dev/)
- **Arquitetura**: Organização por features (módulos) e camadas (View, Store, Service).
- **Gerenciamento de Estado**: [MobX](https://mobx.pub/) para um gerenciamento de estado reativo e previsível.
- **Injeção de Dependência**: [GetIt](https://pub.dev/packages/get_it) como localizador de serviços para desacoplar as dependências.
- **Requisições HTTP**: [Dio](https://pub.dev/packages/dio) para uma comunicação robusta e configurável com a API.
- **Armazenamento Local**: [Shared Preferences](https://pub.dev/packages/shared_preferences) para persistir o token de autenticação do usuário.
- **Testes**:
  - **Testes de Unidade e Integração**: Utilizando `flutter_test`.
  - **Mocks**: Mocktail para criar mocks de dependências de forma simples e eficaz.

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
