import 'package:usafl/components/item.dart';

class KitchenChecklist {
  int itemNumber = 0;
  int completed = 0;

  final List<Item> checklist = [
    Item(c: 'Kitchen',
        i: 'Housing must include adequate and sanitary kitchen space, including cabinets, counter space, tables, and chairs.',
        v: false),
    Item(c: 'Kitchen',
        i: 'Cooking facilities must be provided for each family unit.',
        v: false),
    Item(c: 'Kitchen',
        i: 'Housing must include one working refrigerator for every six workers.',
        v: false),
    Item(c: 'Kitchen',
        i: 'Housing must include one working stove for every ten occupants.',
        v: false),
    Item(c: 'Kitchen',
        i: 'The housing must have at least one hand-washing sink for every six occupants.',
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
    if (itemNumber >= checklist.length -1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    itemNumber = 0;
  }
}