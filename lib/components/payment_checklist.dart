import 'package:usafl/components/item.dart';

class PaymentChecklist {
  int itemNumber = 0;
  int completed = 0;

  final List<Item> checklist = [
    Item(c: 'Payment',
        i: 'Earnings records must note each workers\' first and last day of work.',
        v: false),
    Item(c: 'Payment',
        i: 'Earnings records must include each workers\' name and permanent home address in his/her country of origin.',
        v: false),
    Item(c: 'Payment',
        i: 'Earnings records must include your business\'s FEIN number.',
        v: false),
    Item(c: 'Payment',
        i: 'Earnings records must include the number of hours offered each day to ensure you met the 3/4 Guarantee.',
        v: false),
    Item(c: 'Payment',
        i: 'Earnings records must include the number of hours actually worked each day.',
        v: false),
    Item(c: 'Payment',
        i: 'Earnings records must include each worker\'s rate of pay.',
        v: false),
    Item(c: 'Payment',
        i: 'Earnings records must note each worker\'s total earnings for each pay period',
        v: false),
    Item(c: 'Payment',
        i: 'Earnings records must note any and all deductions, along with reasons for those deductions. If there were no deductions, the records should note that.',
        v: false),
    Item(c: 'Payment',
        i: 'Earnings records must note and explain any differences in wages between workers performing the same job duties.',
        v: false),
    Item(c: 'Payment',
        i: 'Earnings records must note and explain any differences between the wage rate listed in the Job Order and the wage rate actually paid.',
        v: false),
    ];

  void nextQuestion() {
    if (itemNumber < checklist.length - 1) {
      itemNumber++;
    }
  }

  String getCategory() {
    return checklist[itemNumber].category;
  }

  String getItem() {
    return checklist[itemNumber].item;
  }

  bool getValue() {
    return checklist[itemNumber].value;
  }

  void setValue(bool value) {
    checklist[itemNumber].value = value;
  }

  bool isFinished() {
    if (itemNumber >= checklist.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    itemNumber = 0;
  }
}