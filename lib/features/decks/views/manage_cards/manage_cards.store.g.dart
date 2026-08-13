// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_cards.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManageCardsStore on ManageCardsStoreBase, Store {
  late final _$deckAtom = Atom(
    name: 'ManageCardsStoreBase.deck',
    context: context,
  );

  @override
  Deck? get deck {
    _$deckAtom.reportRead();
    return super.deck;
  }

  @override
  set deck(Deck? value) {
    _$deckAtom.reportWrite(value, super.deck, () {
      super.deck = value;
    });
  }

  late final _$questionsAtom = Atom(
    name: 'ManageCardsStoreBase.questions',
    context: context,
  );

  @override
  ObservableList<Question> get questions {
    _$questionsAtom.reportRead();
    return super.questions;
  }

  @override
  set questions(ObservableList<Question> value) {
    _$questionsAtom.reportWrite(value, super.questions, () {
      super.questions = value;
    });
  }

  late final _$ManageCardsStoreBaseActionController = ActionController(
    name: 'ManageCardsStoreBase',
    context: context,
  );

  @override
  void init(Deck deck) {
    final _$actionInfo = _$ManageCardsStoreBaseActionController.startAction(
      name: 'ManageCardsStoreBase.init',
    );
    try {
      return super.init(deck);
    } finally {
      _$ManageCardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addQuestion(Question question) {
    final _$actionInfo = _$ManageCardsStoreBaseActionController.startAction(
      name: 'ManageCardsStoreBase.addQuestion',
    );
    try {
      return super.addQuestion(question);
    } finally {
      _$ManageCardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeQuestion(Question question) {
    final _$actionInfo = _$ManageCardsStoreBaseActionController.startAction(
      name: 'ManageCardsStoreBase.removeQuestion',
    );
    try {
      return super.removeQuestion(question);
    } finally {
      _$ManageCardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reorderQuestions(int oldIndex, int newIndex) {
    final _$actionInfo = _$ManageCardsStoreBaseActionController.startAction(
      name: 'ManageCardsStoreBase.reorderQuestions',
    );
    try {
      return super.reorderQuestions(oldIndex, newIndex);
    } finally {
      _$ManageCardsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deck: ${deck},
questions: ${questions}
    ''';
  }
}
