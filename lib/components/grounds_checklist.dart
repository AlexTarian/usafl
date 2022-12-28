import 'package:usafl/components/item.dart';

class GroundsChecklist {
  int itemNumber = 0;
  int completed = 0;

  final List<Item> checklist = [
    Item(c: 'Grounds',
        i: 'Grounds around housing must be sanitary and maintained.',
        v: false),
    Item(c: 'Grounds',
        i: 'Housing site must be adequately drained.',
        v: false),
    Item(c: 'Grounds',
        i: 'Housing must be at least 200 feet from stagnating collections of water).',
        v: false),
    Item(c: 'Grounds',
        i: 'Drainage from site must not endanger water supply.',
        v: false),
    Item(c: 'Grounds',
        i: 'Housing site must be free from depressions that could flood in inclement weather.',
        v: false),
    Item(c: 'Grounds',
        i: 'Housing units must be adequately spaced apart to avoid overcrowding.',
        v: false),
    Item(c: 'Grounds',
        i: 'Livestock must not be kept fewer than 500 feet from the housing.',
        v: false),
    Item(c: 'Grounds',
        i: 'Any abandoned privy and garbage pits must be filled with earth.',
        v: false),
    Item(c: 'Grounds',
        i: 'Whenever the housing is not going to be used, privy buildings must be locked.',
        v: false),
    Item(c: 'Grounds',
        i: 'If public sewers are available, all sewer lines and floor drains must be connected (sewage seepage on ground is not permitted).',
        v: false),
    Item(c: 'Grounds',
        i: 'Housing must include an adequate and convenient water supply (piped into the house or available within 100 feet of the house), approved by health authority.',
        v: false),
    Item(c: 'Grounds',
        i: 'If a central water source is used by more than one family, drinking cups must not be being shared.',
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