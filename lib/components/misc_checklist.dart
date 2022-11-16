import 'package:usafl/components/item.dart';

class MiscChecklist {
  int itemNumber = 0;
  int completed = 0;

  final List<Item> checklist = [
    Item(c: 'Miscellaneous',
        i: 'The employer must be aware that he or she must immediately report to the local health office the name of any individual who is known or suspected of having a communicable disease.',
        v: false),
    Item(c: 'Miscellaneous',
        i: 'The employer must be aware that he or she must immediately report to the local health authority in the event of suspected food poisoning or an unusual prevalence of fever, diarrhea, sore throat, vomiting, and/or jaundice among the workers.',
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