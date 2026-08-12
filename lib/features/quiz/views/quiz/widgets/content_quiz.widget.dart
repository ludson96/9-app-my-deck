import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../quiz.store.dart';
import 'quiz_answer_button.widget.dart';

class ContentQuiz extends StatelessWidget {
  final QuizStore store;

  const ContentQuiz({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final currentQ = store.deck!.questions[store.currentQuestion];
        final isAnswerVisible = !store.showAsk;

        return Column(
          children: [
            // Question Counter Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Progresso do Quiz",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${store.currentQuestion + 1} / ${store.deck!.questions.length}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Card Body
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(12),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Question Label
                      Row(
                        children: [
                          Icon(
                            Icons.help_outline_rounded,
                            size: 18,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "PERGUNTA",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Question Text
                      Text(
                        currentQ.ask,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Toggle Button (Show/Hide Answer)
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1.5,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: store.alterAskAndAnswer,
                        icon: Icon(
                          isAnswerVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20,
                        ),
                        label: Text(
                          isAnswerVisible
                              ? "Esconder resposta"
                              : "Mostrar resposta",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Answer Section
                      if (isAnswerVisible) ...[
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline_rounded,
                                    size: 18,
                                    color: Colors.green.shade700,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "RESPOSTA",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.1,
                                      color: Colors.green.shade800,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                currentQ.answer,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Action Answer Buttons (Errei / Acertei)
            Row(
              children: [
                QuizAnswerButton(
                  label: "Errei :(",
                  icon: Icons.close_rounded,
                  color: Colors.red.shade600,
                  onPressed: () => store.nextQuestion(false),
                ),
                const SizedBox(width: 12),
                QuizAnswerButton(
                  label: "Acertei :)",
                  icon: Icons.check_rounded,
                  color: Colors.green.shade600,
                  onPressed: () => store.nextQuestion(true),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
