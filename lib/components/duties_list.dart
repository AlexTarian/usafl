class Duty {
  late String category;
  late String item;

  Duty({c, i}) {
    category = c;
    item = i;
  }
}

class ArrivalChecklist {
  int itemNumber = 0;
  int completed = 0;

  final List<Duty> checklist = [
    Duty(c: 'Arrival', i: 'Placeholder'),
    Duty(c: 'Equipment', i: 'Attach implements (plow, disc, drill, etc.) to tractor'),
    Duty(c: 'Equipment', i: 'Check on product drying apparatus'),
    Duty(c: 'Equipment', i: 'Crop baling'),
    Duty(c: 'Equipment', i: 'Cultivate crops'),
    Duty(c: 'Equipment', i: 'Drive and operate Farm Machinery'),
    Duty(c: 'Equipment', i: 'Drive and operate self-propelled combine'),
    Duty(c: 'Equipment', i: 'Drive grain trucks'),
    Duty(c: 'Equipment', i: 'Ginning'),
    Duty(c: 'Equipment', i: 'Harvest crops'),
    Duty(c: 'Equipment', i: 'Hay buckling'),
    Duty(c: 'Equipment', i: 'Husking'),
    Duty(c: 'Equipment', i: 'Load commodities into hoppers, containers, or conveyors'),
    Duty(c: 'Equipment', i: 'Lubricate equipment'),
    Duty(c: 'Equipment', i: 'Maintain equipment'),
    Duty(c: 'Equipment', i: 'Operate a baler'),
    Duty(c: 'Equipment', i: 'Operate towed equipment to plant, fertilize, dust, or spray crops'),
    Duty(c: 'Equipment', i: 'Operate towed equipment to spread manure'),
    Duty(c: 'Equipment', i: 'Plant crops'),
    Duty(c: 'Equipment', i: 'Plow soil'),
    Duty(c: 'Equipment', i: 'Shelling'),
    Duty(c: 'Equipment', i: 'Spread manure'),
    Duty(c: 'Equipment', i: 'Store crops'),
    Duty(c: 'Equipment', i: 'Threshing'),
    Duty(c: 'Equipment', i: 'Till Soil'),
    Duty(c: 'Equipment', i: 'Tow harvesting equipment'),
    Duty(c: 'Equipment', i: 'Transport crops to elevator, storage area, etc.'),
    Duty(c: 'Equipment', i: 'Use GPS autosteer systems'),
    Duty(c: 'Equipment', i: 'Use swather'),
    Duty(c: 'Equipment', i: 'Haul hay on hay trailer'),
    Duty(c: 'Equipment', i: 'Load hay bales onto truck/trailer'),
    Duty(c: 'Equipment', i: 'Use loader tractor to move manure'),
    Duty(c: 'Equipment', i: 'Use forklift'),
    Duty(c: 'Equipment', i: 'Use Skid-steer loader'),
    Duty(c: 'General', i: 'Apply pesticides, herbicides, or fertilizers to crops'),
    Duty(c: 'General', i: 'Clean and pack product'),
    Duty(c: 'General', i: 'Clean bins'),
    Duty(c: 'General', i: 'Clear & maintain irrigation ditches'),
    Duty(c: 'General', i: 'Construct trellises'),
    Duty(c: 'General', i: 'Discard diseased or rotten products'),
    Duty(c: 'General', i: 'Harvest product by hand'),
    Duty(c: 'General', i: 'Identify pests & weeds and best means of removal'),
    Duty(c: 'General', i: 'Irrigate soil'),
    Duty(c: 'General', i: 'Load grain trucks'),
    Duty(c: 'General', i: 'Clean and Maintain yards, grounds, and facilities'),
    Duty(c: 'General', i: 'Maintain irrigation systems'),
    Duty(c: 'General', i: 'Maintain/build fences'),
    Duty(c: 'General', i: 'Mix materials and/or chemicals for planter or sprayer'),
    Duty(c: 'General', i: 'Oversee activities of work crews'),
    Duty(c: 'General', i: 'Plant product by hand'),
    Duty(c: 'General', i: 'Prune product'),
    Duty(c: 'General', i: 'Record information about crops, chemical use, and progress'),
    Duty(c: 'General', i: 'Remove weeds by hand'),
    Duty(c: 'General', i: 'Remove weeds using chemicals'),
    Duty(c: 'General', i: 'Seed cleaning'),
    Duty(c: 'General', i: 'Supervise crop farm workers'),
    Duty(c: 'General', i: 'Transplant seedlings'),
    Duty(c: 'General', i: 'Use hand tools to tend to plants'),
    Duty(c: 'Livestock', i: 'Apply/administer medications/vaccinations to livestock'),
    Duty(c: 'Livestock', i: 'Assist with artificial insemination'),
    Duty(c: 'Livestock', i: 'Assist with birthing/calving'),
    Duty(c: 'Livestock', i: 'Brand livestock'),
    Duty(c: 'Livestock', i: 'Castrate livestock'),
    Duty(c: 'Livestock', i: 'Check/maintain cattle feed & water equipment'),
    Duty(c: 'Livestock', i: 'Clean livestock stalls with disinfectant'),
    Duty(c: 'Livestock', i: 'Confine livestock to stalls'),
    Duty(c: 'Livestock', i: 'Feed livestock'),
    Duty(c: 'Livestock', i: 'Groom livestock'),
    Duty(c: 'Livestock', i: 'Herd livestock'),
    Duty(c: 'Livestock', i: 'Inspect livestock for illness/injury'),
    Duty(c: 'Livestock', i: 'Maintain breeding, feeding, and cost records'),
    Duty(c: 'Livestock', i: 'Maintain livestock equipment'),
    Duty(c: 'Livestock', i: 'Make hay feed'),
    Duty(c: 'Livestock', i: 'Mix additives in feed'),
    Duty(c: 'Livestock', i: 'Order feed for animals'),
    Duty(c: 'Livestock', i: 'Perform embryo transfer'),
    Duty(c: 'Livestock', i: 'Perform ultrasounds on cattle'),
    Duty(c: 'Livestock', i: 'Place mineral blocks'),
    Duty(c: 'Livestock', i: 'Prepare pregnant livestock for birthing/calving (wash, etc.)'),
    Duty(c: 'Livestock', i: 'Protect livestock from predators'),
    Duty(c: 'Livestock', i: 'Spray livestock with insecticide'),
    Duty(c: 'Livestock', i: 'Tend to pregnant cattle'),
    Duty(c: 'Livestock', i: 'Tend to young calves'),
    Duty(c: 'Livestock', i: 'Transport cattle'),
    Duty(c: 'Livestock', i: 'Weigh livestock'),
    Duty(c: 'Livestock', i: 'Collect and remove manure from livestock facilities'),
    Duty(c: 'Winter', i: 'Construct windbreaks for livestock'),
    Duty(c: 'Winter', i: 'Maintain heated watering system'),
    Duty(c: 'Winter', i: 'Operate snow removal equipment'),
    Duty(c: 'Winter', i: 'Break up ice in watering troughs'),
    Duty(c: 'Mechanical', i: 'Incidental Maintenance'),
    Duty(c: 'Mechanical', i: 'Incidental equipment cleaning'),
    Duty(c: 'Mechanical', i: 'Incidental repainting'),
    Duty(c: 'Mechanical', i: 'Changing oil as needed'),
    Duty(c: 'Mechanical', i: 'Equipment Disassembly & Reassembly'),
    Duty(c: 'Mechanical', i: 'Thorough Repairs'),
    Duty(c: 'Mechanical', i: 'Welding'),
    Duty(c: 'Mechanical', i: 'Fabricating'),
    Duty(c: 'Mechanical', i: 'Sanding/Grinding'),

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