class QuizQuestions {
  const QuizQuestions(this.que, this.ans);

  final String que;
  final List<String> ans;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(ans);
    shuffledList.shuffle();
    return shuffledList;
  }
}
