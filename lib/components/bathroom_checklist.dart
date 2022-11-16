import 'package:usafl/components/item.dart';

class BathroomChecklist {
  int itemNumber = 0;
  int completed = 0;

  final List<Item> checklist = [
    Item(c: 'Bathrooms',
        i: 'The housing must have at least one toilet for every 10 occupants.',
        v: false),
    Item(c: 'Bathrooms',
        i: 'Each bathroom must have a window not less than 6 square feet in an area opening directly to the outside area or is otherwise satisfactorily ventilated.',
        v: false),
    Item(c: 'Bathrooms',
        i: 'All ventilation openings on the bathroom must be screened with 16-mesh in good condition.',
        v: false),
    Item(c: 'Bathrooms',
        i: 'Outdoor bathrooms must be located within 200 feet, but not closer than 100 feet, of the housing.',
        v: false),
    Item(c: 'Bathrooms',
        i: 'Male and female workers must have separate bathrooms that are clearly marked.',
        v: false),
    Item(c: 'Bathrooms',
        i: 'Each bathroom must be properly and safely lit.',
        v: false),
    Item(c: 'Bathrooms',
        i: 'Each bathroom must be clean and has an adequate supply of toilet paper.',
        v: false),
    Item(c: 'Bathrooms',
        i: 'The housing must have at least one hand-washing sink for every six occupants.',
        v: false),
    Item(c: 'Bathrooms',
        i: 'The housing must have at least one showerhead for every 10 occupants.',
        v: false),
    Item(c: 'Bathrooms',
        i: 'Shower facilities and laundry rooms must have floor drains to remove wastewater.',
        v: false),
    Item(c: 'Bathrooms',
        i: 'Junctions between curbing and the shower floor must be covered.',
        v: false),
    Item(c: 'Bathrooms',
        i: 'All walls and partitions of shower rooms must be smooth and impervious to the height of splashing.',
        v: false),
    Item(c: 'Bathrooms',
        i: 'Showers, sinks, and laundry facilities must have an adequate supply of hot and cold water for all occupants.',
        v: false),
    Item(c: 'Bathrooms',
        i: 'If a central service building is used for laundry or bathing, it must have equipment capable of maintaining a temperature of at least 70°F during cold weather.',
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