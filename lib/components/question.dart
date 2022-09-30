class Question {
  late String questionText;
  late String questionAnswer;
  late String optionA;
  late String optionB;
  late String optionC;
  late String optionD;
  late String explanation;

  Question({q, a, oA, oB, oC, oD, exp}) {
    questionText = q;
    questionAnswer = a;
    optionA = oA;
    optionB = oB;
    optionC = oC;
    optionD = oD;
    explanation = exp;
  }
}