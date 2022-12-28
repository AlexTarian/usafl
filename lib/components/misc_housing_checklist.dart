import 'package:usafl/components/item.dart';

class MiscHousingChecklist {
  int itemNumber = 0;
  int completed = 0;

  final List<Item> checklist = [
    Item(c: 'MiscHousing',
        i: 'The housing must have a laundry tray or tub for every 30 occupants.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'Each service building used for laundry, handwashing, and bathing must have a slop sink.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'Laundry room floors must have a smooth finish and must be impervious to moisture.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'Showers, sinks, and laundry facilities must have an adequate supply of hot and cold water for all occupants.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'If a central service building is used for laundry or bathing, it must have equipment capable of maintaining a temperature of at least 70°F during cold weather.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'Facilities for drying clothes must be provided.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'All service buildings must be kept clean.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'Housing must have at least one type A/B/C fire extinguisher.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'Housing must have at least one approved first aid kit.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'Each room must have a functioning smoke detector.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'If using gas heaters, the housing must have carbon monoxide detectors.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'Adequate measures must be taken to prevent infestations of insects, rodents, and other pests.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'At least two closeable, rodent- and insect-proof garbage receptacles must be provided.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'Outside garbage cans must be within 100 feet of each building and must be on wood or concrete pads.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'Garbage containers must be kept clean.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'Garbage must be hauled from the site at least once each week or more if needed.',
        v: false),
    Item(c: 'MiscHousing',
        i: 'Garbage bags must not be stored outside of garbage cans.',
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