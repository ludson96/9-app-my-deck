import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../shared/models/deck.model.dart';
import '../../../../shared/models/question.model.dart';
import '../add_question/add_question.page.dart';
import 'manage_cards.store.dart';

class ManageCardsPage extends StatefulWidget {
  final Deck deck;

  const ManageCardsPage({super.key, required this.deck});

  @override
  State<ManageCardsPage> createState() => _ManageCardsPageState();
}

class _ManageCardsPageState extends State<ManageCardsPage> {
  late final ManageCardsStore _store;

  @override
  void initState() {
    super.initState();
    _store = ManageCardsStore()..init(widget.deck);
  }

  Future<void> _navigateToAddQuestion() async {
    final question = await Navigator.of(context).push<Question>(
      MaterialPageRoute(
        builder: (_) => AddQuestionPage(deckId: widget.deck.id),
      ),
    );

    if (question != null) {
      _store.addQuestion(question);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        final updatedDeck = widget.deck.copyWith(
          questions: List<Question>.from(_store.questions),
        );
        Navigator.of(context).pop(updatedDeck);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text("Gerenciar Cards - ${widget.deck.name}"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              final updatedDeck = widget.deck.copyWith(
                questions: List<Question>.from(_store.questions),
              );
              Navigator.of(context).pop(updatedDeck);
            },
          ),
        ),
        body: Observer(
          builder: (context) {
            if (_store.questions.isEmpty) {
              return const Center(
                child: Text(
                  "Nenhum cartão cadastrado neste deck.",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              );
            }

            return ReorderableListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _store.questions.length,
              onReorder: _store.reorderQuestions,
              proxyDecorator:
                  (Widget child, int index, Animation<double> animation) {
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (BuildContext context, Widget? child) {
                        return Material(
                          elevation: 6,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          child: child,
                        );
                      },
                      child: child,
                    );
                  },
              itemBuilder: (context, index) {
                final card = _store.questions[index];
                return Card(
                  key: ValueKey(card.id),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    title: Text(
                      card.ask,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        "R: ${card.answer}",
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          onPressed: () => _store.removeQuestion(card),
                        ),
                        const SizedBox(width: 8),
                        ReorderableDragStartListener(
                          index: index,
                          child: const Icon(
                            Icons.drag_handle,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _navigateToAddQuestion,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add),
          label: const Text("Criar Card"),
        ),
      ),
    );
  }
}
