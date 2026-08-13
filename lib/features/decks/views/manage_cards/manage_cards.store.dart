import 'package:mobx/mobx.dart';

import '../../../../shared/models/deck.model.dart';
import '../../../../shared/models/question.model.dart';

part 'manage_cards.store.g.dart';

class ManageCardsStore = ManageCardsStoreBase with _$ManageCardsStore;

abstract class ManageCardsStoreBase with Store {
  @observable
  Deck? deck;

  @observable
  ObservableList<Question> questions = <Question>[].asObservable();

  @action
  void init(Deck deck) {
    this.deck = deck;
    questions = List<Question>.from(deck.questions).asObservable();
  }

  @action
  void addQuestion(Question question) {
    questions.add(question);
  }

  @action
  void removeQuestion(Question question) {
    questions.remove(question);
  }

  @action
  void reorderQuestions(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = questions.removeAt(oldIndex);
    questions.insert(newIndex, item);
  }
}
