class Question {
  late String questionText;
  late String questionAnswer;
  late String optionA;
  late String optionB;
  late String optionC;
  late String optionD;

  Question({q, a, oA, oB, oC, oD}) {
    questionText = q;
    questionAnswer = a;
    optionA = oA;
    optionB = oB;
    optionC = oC;
    optionD = oD;
  }
}