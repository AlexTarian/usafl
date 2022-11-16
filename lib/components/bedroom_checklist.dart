import 'package:usafl/components/item.dart';

class BedroomChecklist {
  int itemNumber = 0;
  int completed = 0;

  final List<Item> checklist = [
    Item(c: 'Bedrooms',
        i: 'Sleeping rooms located above the first floor must have a fixed ladder to the ground installed.',
        v: false),
    Item(c: 'Bedrooms',
        i: 'Beds, bedding, and suitable storage facilities must be provided in all bedrooms.',
        v: false),
    Item(c: 'Bedrooms',
        i: 'Each occupant must have his/her own bed.',
        v: false),
    Item(c: 'Bedrooms',
        i: 'Beds must be at least three feet from each other.',
        v: false),
    Item(c: 'Bedrooms',
        i: 'Bunk beds must be at least four feet from other beds.',
        v: false),
    Item(c: 'Bedrooms',
        i: 'Bunk beds must have a minimum of twenty-seven inches of clearance between bunks.',
        v: false),
    Item(c: 'Bedrooms',
        i: 'Bunk beds must have a minimum of twenty-seven inches of clearance between the top bunk and ceiling.',
        v: false),
    Item(c: 'Bedrooms',
        i: 'Beds must be a minimum of twelve inches off the floor.',
        v: false),
    Item(c: 'Bedrooms',
        i: 'Triple-deck bunks must not be being used.',
        v: false),
    Item(c: 'Bedrooms',
        i: 'Each room must have at least one window that can be used for ventilation and as an emergency exit.',
        v: false),
    Item(c: 'Bedrooms',
        i: 'Window area must not be less than 10% of the floor space.',
        v: false),
    Item(c: 'Bedrooms',
        i: 'Each exterior opening must be screened with 16-mesh material in good condition.',
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