import 'package:flutter/material.dart';

import '../../../../../shared/models/deck.model.dart';
import '../../manage_cards/manage_cards.page.dart';
import '../deck_detail.store.dart';

class ManageCardsButton extends StatelessWidget {
  final DeckDetailStore _store;

  const ManageCardsButton({
    Key? key,
    required DeckDetailStore store,
  })  : _store = store,
        super(key: key);

  Future<void> _openManageCards(BuildContext context) async {
    final updatedDeck = await Navigator.of(context).push<Deck>(
      MaterialPageRoute(
        builder: (_) => ManageCardsPage(
          deck: _store.deck!,
        ),
      ),
    );

    if (updatedDeck != null) {
      _store.setDeck(updatedDeck);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 250,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: const BorderSide(
            color: Colors.black,
          ),
        ),
        onPressed: () => _openManageCards(context),
        child: const Text(
          "Gerenciar Cards",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
