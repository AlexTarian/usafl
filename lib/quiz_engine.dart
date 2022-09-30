import 'package:usafl/components/question.dart';

class QuizEngine {
  int questionNumber = 0;

  final List<Question> questionBank = [
    Question(q: 'A need for additional workers is considered seasonal if:', a: 'A',
      oA: 'It’s tied to seasonal cycles.',
      oB: 'It lasts fewer than 12 months.',
      oC: 'It’s only happening one time.',
      oD: 'It doesn’t involve work with livestock.',
      exp: 'A need is considered seasonal if it’s tied to seasonal cycles. For example, crop farming is usually considered seasonal because crops grow better during some seasons and not during others.',
    ),
    Question(q: 'A need for additional workers is considered temporary if:', a: 'B',
      oA: 'It’s tied to seasonal cycles.',
      oB: 'It lasts fewer than 12 months.',
      oC: 'It’s only happening one time.',
      oD: 'It doesn’t involve work with livestock.',
      exp: 'A need is considered temporary if it lasts fewer than 12 months. HOWEVER, the Department of Labor generally questions needs lasting longer than 10 months.',
    ),
    Question(q: 'As a rule of thumb, a job is considered agricultural if:', a: 'C',
      oA: 'It involves processing agricultural commodities.',
      oB: 'It is done on a farm or for a farmer.',
      oC: 'It is done on a farm or by a farmer.',
      oD: 'It is done within an 150-mile radius of a farm.',
      exp: 'A need is considered agricultural if it is either done on a farm or BY a farmer (i.e., a business that produces at least 50% of the commodities it works with).',
    ),
    Question(q: 'How many workers should you request?', a: 'A',
      oA: 'As many as you estimate you’ll need',
      oB: 'As many as you estimate you’ll need, plus one, just in case',
      oC: 'There is no limit',
      oD: 'Fewer than 25',
      exp: 'You should only request as many workers as you genuinely estimate you’ll need. Padding the numbers can get you in trouble.',
    ),
    Question(q: 'Which of the following do you NOT need to reimburse workers for upon arrival?', a: 'D',
      oA: 'All travel expenses (e.g., flight tickets)',
      oB: 'Consulate fee',
      oC: 'Subsistence cost for each day of travel (e.g., meal costs)',
      oD: 'Passport costs',
      exp: 'Passports are considered primarily for the benefit of the worker, so you do not need to reimburse that cost.',
    ),
    Question(q: 'Which are you NOT required to provide to workers at no cost to them?', a: 'D',
      oA: 'Furnished housing that has passed a SWA inspection',
      oB: 'Transportation to the worksite every day and to the grocery store once a week',
      oC: 'Gear, tools, and a means of two-way communication',
      oD: 'Internet service for recreational use',
      exp: 'The regulations do not require you to provide internet service unless it is necessary for the job.',
    ),
    Question(q: 'What is the rule about overtime in the H-2A Program?', a: 'C',
      oA: 'All H-2A workers are exempt from overtime.',
      oB: 'All H-2A workers are subject to overtime.',
      oC: 'H-2A workers may be subject depending on state laws and the nature of the job.',
      oD: 'H-2A workers may be subject to overtime if their home country requires it.',
      exp: 'Agricultural workers are exempt from federal overtime laws. HOWEVER, some states require overtime pay for agricultural workers. Workers doing non-agricultural job duties are also subject.',
    ),
    Question(q: 'Which deductions can you take from a workers pay?', a: 'A',
      oA: 'Taxes--if the worker requests withholding and signs a W4',
      oB: 'Deductions for damages',
      oC: 'Deductions to clean the housing',
      oD: 'All of the above',
      exp: 'Aside from taxes (if the worker signs a W4), you should not take any deductions from a worker\'s pay.',
    ),
    Question(q: 'How often are you required to pay workers?', a: 'C',
      oA: 'Weekly',
      oB: 'Bi-weekly ',
      oC: 'Weekly, bi-weekly, or semi-monthly',
      oD: 'Monthly',
      exp: 'Workers must be paid at least twice per month. Therefore, you can pay weekly, bi-weekly, or semi-monthly. This must be specified in advance on your Job Order.',
    ),
    Question(q: 'For which reason can you hire H-2A workers during the winter?', a: 'B',
      oA: 'You have more work that needs to be done.',
      oB: 'You have a legitimate, seasonal need for workers during that time.',
      oC: 'The worker does not want to return home.',
      oD: 'You cannot hire workers during the winter.',
      exp: 'As is the case during any time of the year, you can only request certification to hire H-2A workers during the winter if you have a legitimate, seasonal need.',
    ),
    Question(q: 'When it comes to taxes, what are you required to do?', a: 'D',
      oA: 'Withhold only federal income taxes and provide a W2.',
      oB: 'Withhold only state and federal income taxes and provide a W2.',
      oC: 'Withhold all normal taxes and provide a W2.',
      oD: 'Taxes are the worker’s responsibility; you just need to provide a W2.',
      exp: 'Taxes are the worker’s responsibility. You just need to provide a W2. However, you can withhold taxes if the worker asks you to and signs a W4.',
    ),
    Question(q: 'What fees can you charge workers?', a: 'D',
      oA: 'Recruitment Fee (to reimburse you for the fees you have paid)',
      oB: 'Rental fees for the housing',
      oC: 'Rental fee for work tools',
      oD: 'You may not charge workers fees of any kind.',
      exp: 'Never charge workers fees of any kind. That is a serious violation.',
    ),
    Question(q: 'If an American worker applies for the job you are hiring H-2A workers to perform (before the half-way point of the job), what are you required to do?', a: 'B',
      oA: 'Interview the worker and offer him/her the job if you have not hired enough workers.',
      oB: 'Interview the worker and offer him/her the job if he/she is qualified.',
      oC: 'Interview the worker.',
      oD: 'You have no obligations.',
      exp: 'In such a case, you must treat the worker fairly. You are required to interview the worker and offer him/her the job if he/she is qualified.',
    ),
    Question(q: 'When are you required to complete Recruitment Reports?', a: 'B',
      oA: 'During the application process',
      oB: 'During the application phase and at the half-way point of the job',
      oC: 'During the application phase and at the end of the job',
      oD: 'At the end of the job',
      exp: 'You required to complete Recruitment Reports during the application phase and at the half-way point of the job.',
    ),
    Question(q: 'Which of the following is NOT required to be included on workers’ pay slips?', a: 'A',
      oA: 'Their housing addresses where they are staying during the job',
      oB: 'Their permanent foreign addresses',
      oC: 'Their hours worked per day and the total for the pay period',
      oD: 'Their hours offered per day and the total for the pay period',
      exp: 'You are not required to include their housing addresses where they are staying during the job. HOWEVER, you will need to include their permanent, foreign addresses.',
    ),
    Question(q: 'What is the three-quarter rule?', a: 'C',
      oA: 'You are required to reimburse workers at least ¾ of their travel expenses.',
      oB: 'You are required to pay workers at least ¾ of their regular pay if they take sick time off.',
      oC: 'You are required to offer workers at least ¾ of the total hours of work listed on the application.',
      oD: 'Workers are required to complete ¾ of the total job hours.',
      exp: 'You are required to offer workers at least ¾ of the total hours of work listed on the application. There is a lot of nuance here. Be sure to check our resources.',
    ),
    Question(q: 'What are the limitations of an H-2A worker’s visa?', a: 'A',
      oA: 'Workers may only work for specified employers at approved worksites doing approved duties.',
      oB: 'Workers may only work for employers with Labor Certifications.',
      oC: 'Workers may only work within an 150-mile radius of their housing.',
      oD: 'Workers may only work within the state listed on their paperwork.',
      exp: 'Workers may only work for specified employers at approved worksites doing approved duties.',
    ),
    Question(q: 'At a minimum how much are you required to pay workers?', a: 'D',
      oA: 'The Federal Minimum Wage',
      oB: 'The State Minimum Wage',
      oC: 'Your state’s Adverse Effect Wage Rate',
      oD: 'The highest of the answers listed above',
      exp: 'You are required to pay the highest of the following: federal minimum wage, state minimum wage, the prevailing wage, or the Adverse Effect Wage Rate',
    ),
    Question(q: 'Why is it important to help workers get Social Security Cards shortly after arrival?', a: 'B',
      oA: 'If you don\'t, the workers won\'t be able to fly home.',
      oB: 'If you don\'t, you could be on the hook for backup withholding.',
      oC: 'If you don\'t, the workers will be on the hook for unnecessary taxes.',
      oD: 'If you don\'t, the workers won\'t be able to renew their visas.',
      exp: 'If a worker doesn\'t get a Social Security Number, you could be on the hook to pay his or her taxes yourself.',
    ),
    Question(q: 'How long are you required to keep all your records of your use of the program?', a: 'C',
      oA: 'Until the end of the job',
      oB: 'For a year after the end of the job',
      oC: 'For three years after the end of the job',
      oD: 'For seven years after the end of the job',
      exp: 'You are required to keep all your records for at least three years after the end of the job.',
    ),
  ];

  void nextQuestion() {
    if (questionNumber < questionBank.length - 1) {
      questionNumber++;
    }
  }

  String getQuestionText() {
    return questionBank[questionNumber].questionText;
  }

  String getQuestionOptionA() {
    return questionBank[questionNumber].optionA;
  }
  String getQuestionOptionB() {
    return questionBank[questionNumber].optionB;
  }
  String getQuestionOptionC() {
    return questionBank[questionNumber].optionC;
  }
  String getQuestionOptionD() {
    return questionBank[questionNumber].optionD;
  }

  String getCorrectAnswer() {
    return questionBank[questionNumber].questionAnswer;
  }

  String getExplanation() {
    return questionBank[questionNumber].explanation;
  }

    bool isFinished() {
    if (questionNumber >= questionBank.length -1) {

      return true;

    } else {
      return false;
    }
  }

  void reset() {
    questionNumber = 0;
  }
}