import 'package:usafl/components/item.dart';

class ArrivalChecklist {
  int itemNumber = 0;
  int completed = 0;

  final List<Item> checklist = [
    Item(c: 'Arrival',
        i: 'Placeholder',
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
