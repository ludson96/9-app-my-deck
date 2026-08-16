# My Deck App

🇧🇷 Leia isto em [Português](README.md)

> A practical and intuitive app for creating, managing, and studying with flashcards.

## 📝 About the Project
**My Deck** is a mobile application focused on facilitating learning through flashcards. Developed in Flutter, it allows users to create, organize, and manage their own study "decks". It's a simple and efficient tool, ideal for accelerating the memorization of diverse content, whether it's languages, school subjects, or exam preparation.

## 🖼️ Screens (Preview)

<img src="assets/my-deck.gif" alt="App Demonstration" width="300"/>

## ✨ Features

- 🔐 **Secure Authentication**: Account creation and login system to protect user data.
- 🗂️ **Deck Management**: Create, view, edit, and remove your study decks intuitively.
- 🃏 **Card Creation (Flashcards)**: Add and manage questions and answers within each deck.
- 🧠 **Quiz / Study Mode**: Test your knowledge by answering questions from the created decks.

## 🛠️ Technologies and Architecture

The project was built with a focus on quality, scalability, and maintainability, using the following technologies and patterns:

**Core & UI**
- **[Flutter](https://flutter.dev/) & [Dart](https://dart.dev/)**: Framework and core language of the project.
- **Material Design**: Standard visual components from Flutter.

**Architecture & State**
- **Feature-Based Architecture**: Structural organization by modules (`authentication`, `decks`, `quiz`), where each feature has its own View, Store, and Service layers.
- **[MobX](https://mobx.pub/)**: Reactive, simple, and predictable state management.
- **[GetIt](https://pub.dev/packages/get_it)**: Service Locator for Dependency Injection (DI).

**Data & Network**
- **[Dio](https://pub.dev/packages/dio)**: Robust HTTP client for communication with the API.
- **[Shared Preferences](https://pub.dev/packages/shared_preferences)**: Lightweight local storage, used to persist the user's session token.

**Testing & Tools**
- **Automated Testing**: Unit and integration tests using `flutter_test`.
- **[Mocktail](https://pub.dev/packages/mocktail)**: Library for creating mocks in test suites effectively.
- **Code Generation**: Automated code generation with `build_runner` and `mobx_codegen` to optimize development with MobX.

## 🚀 How to Run the Project

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/ludson96/9-app-my-deck.git

    cd 9-app-my-deck
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the application:**
    ```bash
    flutter run
    ```

## 🧪 How to Run Tests

To ensure the quality and correct functioning of all parts of the application, run the following command:

```bash
flutter test
```
