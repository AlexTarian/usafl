import 'package:usafl/components/item.dart';

class HousingChecklist {
  int itemNumber = 0;
  int completed = 0;

  final List<Item> checklist = [
    Item(c: 'Housing',
        i: 'Grounds around housing must be sanitary and maintained.',
        v: false),
    Item(c: 'Housing',
        i: 'Housing site must be adequately drained.',
        v: false),
    Item(c: 'Housing',
        i: 'Housing must be at least 200 feet from stagnating collections of water).',
        v: false),
    Item(c: 'Housing',
        i: 'Drainage from site must not endanger water supply.',
        v: false),
    Item(c: 'Housing',
        i: 'Housing site must be free from depressions that could flood in inclement weather.',
        v: false),
    Item(c: 'Housing',
        i: 'Housing units must be adequately spaced apart to avoid overcrowding.',
        v: false),
    Item(c: 'Housing',
        i: 'Livestock must not be kept fewer than 500 feet from the housing.',
        v: false),
    Item(c: 'Housing',
        i: 'Whenever the housing is not going to be used, garbage must be removed before-hand.',
        v: false),
    Item(c: 'Housing',
        i: 'Any abandoned privy and garbage pits must be filled with earth.',
        v: false),
    Item(c: 'Housing',
        i: 'Whenever the housing is not going to be used, privy buildings must be locked.',
        v: false),
    Item(c: 'Housing',
        i: 'If public sewers are available, all sewer lines and floor drains must be connected (sewage seepage on ground is not permitted).',
        v: false),
    Item(c: 'Housing',
        i: 'Housing must include an adequate and convenient water supply (piped into the house or available within 100 feet of the house), approved by health authority.',
        v: false),
    Item(c: 'Housing',
        i: 'If a central water source is used by more than one family, drinking cups must not be being shared.',
        v: false),
    Item(c: 'Housing',
        i: 'Male and female workers must have separate housing.',
        v: false),
    Item(c: 'Housing',
        i: 'Housing must be lockable from the inside.',
        v: false),
    Item(c: 'Housing',
        i: 'Housing must provide protection from the elements.',
        v: false),
    Item(c: 'Housing',
        i: 'The floor, walls, and roof must be in good condition (free of splinters, holes, exposed nails, etc.).',
        v: false),
    Item(c: 'Housing',
        i: 'The floors must be made of wood, asphalt, or concrete.',
        v: false),
    Item(c: 'Housing',
        i: 'Wooden floors must be smooth, of tight construction, and elevated at least one foot above the ground.',
        v: false),
    Item(c: 'Housing',
        i: 'Each exterior opening must be screened with 16-mesh material in good condition.',
        v: false),
    Item(c: 'Housing',
        i: 'Each exterior screen door must have a functional self-closing device.',
        v: false),
    Item(c: 'Housing',
        i: 'Each occupant must have at least 100 square feet of space, at least fifty of which are in the sleeping area.',
        v: false),
    Item(c: 'Housing',
        i: 'The ceiling must be at least seven feet tall.',
        v: false),
    Item(c: 'Housing',
        i: 'Housing must include an adequate heating system. (Portable non-vented kerosene/propane heaters or open grate fires are NOT allowed.)',
        v: false),
    Item(c: 'Housing',
        i: 'All heating, cooking, plumbing, electrical, and water-heating equipment must be functional and up-to-code.',
        v: false),
    Item(c: 'Housing',
        i: 'The electrical circuits must not be being overloaded.',
        v: false),
    Item(c: 'Housing',
        i: 'Each room must have at least one functional ceiling light fixture and one functional wall outlet',
        v: false),
    Item(c: 'Housing',
        i: 'All required employment posters must be posted somewhere visible and conspicuous.',
        v: false),
    Item(c: 'Housing',
        i: 'The Job Order must be posted somewhere visible and conspicuous.',
        v: false),
    Item(c: 'Housing',
        i: 'The official Inspection Report for the housing must be posted somewhere visible and conspicuous.',
        v: false),
    Item(c: 'Housing',
        i: 'Housing must include adequate and sanitary kitchen space, including cabinets, counter space, tables, and chairs.',
        v: false),
    Item(c: 'Housing',
        i: 'Cooking facilities must be provided for each family unit.',
        v: false),
    Item(c: 'Housing',
        i: 'Housing must include one working refrigerator for every six workers.',
        v: false),
    Item(c: 'Housing',
        i: 'Housing must include one working stove for every ten occupants.',
        v: false),
    Item(c: 'Housing',
        i: 'The housing must have at least one hand-washing sink for every six occupants.',
        v: false),
    Item(c: 'Housing',
        i: 'The housing must have at least one showerhead for every 10 occupants.',
        v: false),
    Item(c: 'Housing',
        i: 'The housing must have a laundry tray or tub for every 30 occupants.',
        v: false),
    Item(c: 'Housing',
        i: 'Each service building used for laundry, handwashing, and bathing must have a slop sink.',
        v: false),
    Item(c: 'Housing',
        i: 'Laundry room floors must have a smooth finish and must be impervious to moisture.',
        v: false),
    Item(c: 'Housing',
        i: 'Shower facilities and laundry rooms must have floor drains to remove wastewater.',
        v: false),
    Item(c: 'Housing',
        i: 'Junctions between curbing and the shower floor must be covered.',
        v: false),
    Item(c: 'Housing',
        i: 'All walls and partitions of shower rooms must be smooth and impervious to the height of splashing.',
        v: false),
    Item(c: 'Housing',
        i: 'Showers, sinks, and laundry facilities must have an adequate supply of hot and cold water for all occupants.',
        v: false),
    Item(c: 'Housing',
        i: 'If a central service building is used for laundry or bathing, it must have equipment capable of maintaining a temperature of at least 70°F during cold weather.',
        v: false),
    Item(c: 'Housing',
        i: 'Facilities for drying clothes must be provided.',
        v: false),
    Item(c: 'Housing',
        i: 'All service buildings must be kept clean.',
        v: false),
    Item(c: 'Housing',
        i: 'Housing must have at least one type A/B/C fire extinguisher.',
        v: false),
    Item(c: 'Housing',
        i: 'Housing must have at least one approved first aid kit.',
        v: false),
    Item(c: 'Housing',
        i: 'Each room must have a functioning smoke detector.',
        v: false),
    Item(c: 'Housing',
        i: 'If using gas heaters, the housing must have carbon monoxide detectors.',
        v: false),
    Item(c: 'Housing',
        i: 'Adequate measures must be taken to prevent infestations of insects, rodents, and other pests.',
        v: false),
    Item(c: 'Housing',
        i: 'At least two closeable, rodent- and insect-proof garbage receptacles must be provided.',
        v: false),
    Item(c: 'Housing',
        i: 'Outside garbage cans must be within 100 feet of each building and must be on wood or concrete pads.',
        v: false),
    Item(c: 'Housing',
        i: 'Garbage containers must be kept clean.',
        v: false),
    Item(c: 'Housing',
        i: 'Garbage must be hauled from the site at least once each week or more if needed.',
        v: false),
    Item(c: 'Housing',
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