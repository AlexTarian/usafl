import 'package:usafl/components/question.dart';

class QuizEngine {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(q: '1. A need for additional workers is considered seasonal if:', a: 'A',
      oA: 'A.	It’s tied to seasonal cycles',
      oB: 'B. It lasts fewer than 12 months',
      oC: 'C. It’s only happening one time',
      oD: 'D. It doesn’t involve work with livestock',
    ),
    Question(q: '2. A need for additional workers is considered temporary if:', a: 'B',
    oA: 'A.	It’s tied to seasonal cycles',
    oB: 'B. It lasts fewer than 12 months',
    oC: 'C. It’s only happening one time',
    oD: 'D. It doesn’t involve work with livestock',
    ),
    Question(q: '3. As a rule of thumb, a job is considered agricultural if:', a: 'C',
      oA: 'A.	It involves processing agricultural commodities',
      oB: 'B. It is done on a farm or for a farmer',
      oC: 'C. It is done on a farm or by a farmer ',
      oD: 'D. It is done within an 150-mile radius of a farm',
    ),
    Question(q: '4. How many workers should you request?', a: 'A',
      oA: 'A.	As many as you estimate you’ll need ',
      oB: 'B. As many as you estimate you’ll need, plus one, just in case',
      oC: 'C. There is no limit',
      oD: 'D. Fewer than 25',
    ),
    Question(q: '5. Which of the following do you NOT need to reimburse workers for upon arrival?', a: 'D',
      oA: 'A.	All travel expenses (e.g., flight tickets)',
      oB: 'B. Consulate fee',
      oC: 'C. Subsistence cost for each day of travel (e.g., meal costs)',
      oD: 'D. Passport costs',
    ),
    Question(q: '6.	Which are you NOT required to provide to workers at no cost to them?', a: 'D',
      oA: 'A.	Furnished housing that has passed a SWA inspection',
      oB: 'B. Transportation to the worksite every day and to the grocery store once a week',
      oC: 'C. Gear, tools, and a means of two-way communication',
      oD: 'D. Internet service',
    ),
    Question(q: '7.	What is the rule about overtime in the H-2A Program?', a: 'C',
      oA: 'A.	All H-2A workers are exempt from overtime',
      oB: 'B. All H-2A workers are subject to overtime ',
      oC: 'C. H-2A workers may be subject depending on state laws and the nature of the job',
      oD: 'D. H-2A workers may be subject to overtime if their home country requires it',
    ),
    Question(q: '8.	Which deductions can you take from a workers pay?', a: 'A',
      oA: 'A.	Taxes if the worker requests withholding and signs a W4',
      oB: 'B. Deductions for damages',
      oC: 'C. Deductions to clean the housing',
      oD: 'D. All of the above',
    ),
    Question(q: '9.	How often are you required to pay workers?', a: 'C',
      oA: 'A.	Weekly',
      oB: 'B. Bi-weekly ',
      oC: 'C. Weekly, bi-weekly, or semi-monthly',
      oD: 'D. Monthly',
    ),
    Question(q: '10.	For which reason can you hire workers during the winter?', a: 'B',
      oA: 'A.	You have more work that needs to be done ',
      oB: 'B. You have a legitimate, seasonal need for workers during that time',
      oC: 'C. The worker does not want to return home',
      oD: 'D. You cannot hire workers during the winter',
    ),
    Question(q: '11.	When it comes to taxes, what are you required to do?', a: 'D',
      oA: 'A.	Withhold only federal income taxes and provide a W2',
      oB: 'B. Withhold only state and federal income taxes and provide a W2',
      oC: 'C. Withhold all normal taxes and provide a W2',
      oD: 'D. Taxes are the worker’s responsibility; you just need to provide a W2',
    ),
    Question(q: '12.	What fees can you charge workers?', a: 'D',
      oA: 'A.	Recruitment Fee (to reimburse you for the fees you have paid)',
      oB: 'B. Rental fees for the housing',
      oC: 'C. Rental fee for work tools',
      oD: 'D. You may not charge workers fees of any kind.',
    ),
    Question(q: '13.	If an American worker applies for the job you are hiring H-2A workers to perform (before the half-way point of the job), what are you required to do?', a: 'B',
      oA: 'A.	Interview the worker and offer him/her the job if you have not hired enough workers',
      oB: 'B. Interview the worker and offer him/her the job if he/she is qualified',
      oC: 'C. Interview the worker',
      oD: 'D. You have no obligations',
    ),
    Question(q: '14.	When are you required to complete Recruitment Reports?', a: 'B',
      oA: 'A.	During the application process ',
      oB: 'B. During the application phase and at the half-way point of the job',
      oC: 'C. During the application phase and at the end of the job',
      oD: 'D. At the end of the job',
    ),
    Question(q: '15.	Which of the following is NOT required to be included on workers’ pay slips?', a: 'A',
      oA: 'A.	Their housing addresses where they are staying during the job',
      oB: 'B. Their permanent foreign addresses',
      oC: 'C. Their hours worked per day and the total for the pay period',
      oD: 'D. Their hours offered per day and the total for the pay period',
    ),
    Question(q: '16.	What is the three-quarter rule?', a: 'C',
      oA: 'A.	You are required to reimburse workers at least ¾ of their travel expenses',
      oB: 'B. You are required to pay workers at least ¾ of their regular pay if they take sick time off',
      oC: 'C. You are required to offer workers at least ¾ of the total hours of work listed on the application',
      oD: 'D. Workers are required to complete ¾ of the total job hours ',
    ),
    Question(q: '17.	What are the limitations of an H-2A worker’s visa?', a: 'A',
      oA: 'A.	Workers may only work for specified employers at approved worksites doing approved duties',
      oB: 'B. Workers may only work for employers with Labor Certifications',
      oC: 'C. Workers may only work within an 150-mile radius of their housing',
      oD: 'D. Workers may only work within the state listed on their paperwork',
    ),
    Question(q: '18.	At a minimum how much are you required to pay workers?', a: 'D',
      oA: 'A.	The Federal Minimum Wage',
      oB: 'B. The State Minimum Wage',
      oC: 'C. Your state’s Adverse Effect Wage Rate',
      oD: 'D. The highest rate of the answers listed above',
    ),
    Question(q: '19.	What are the rules regarding American workers who work alongside H-2A workers?', a: 'B',
      oA: 'A.	If they are listed in the same occupation, they must be paid at least the same wage rate.',
      oB: 'B. If they are doing any of the same job duties, they must be paid at least the same wage rate.',
      oC: 'C. If they work the same hours, they must be paid at least the same wage rate.',
      oD: 'D. If they perform similar duties, they must be informed about the H-2A workers.',
    ),
    Question(q: '20.	How long are you required to keep all your records of your use of the program?', a: 'C',
      oA: 'A.	Until the end of the job',
      oB: 'B. For a year after the end of the job',
      oC: 'C. For three years after the end of the job',
      oD: 'D. For seven years after the end of the job',
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getQuestionOptionA() {
    return _questionBank[_questionNumber].optionA;
  }
  String getQuestionOptionB() {
    return _questionBank[_questionNumber].optionB;
  }
  String getQuestionOptionC() {
    return _questionBank[_questionNumber].optionC;
  }
  String getQuestionOptionD() {
    return _questionBank[_questionNumber].optionD;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

    bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {

      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}