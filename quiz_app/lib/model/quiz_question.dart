class QuizQuestion {
  QuizQuestion(this.question, this.options);
  String question;
  List<String> options;

  List<String> getShuffleAnswers() {
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
