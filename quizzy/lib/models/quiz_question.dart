class quiz_question {
  final String question;
  final List<String> answers;
  const quiz_question(this.question, this.answers);

  List<String> shuffleAnswers() {
    final shuffledList = answers.toList();
    shuffledList.shuffle();
    return shuffledList;
  }
}
