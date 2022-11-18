import 'package:flutter/material.dart';

class Duty {
  late String category;
  late String item;
  bool status = false;
  late IconData picture;
  

  Duty({p, i, c, s}) {
    picture = p;
    item = i;
    category = c;
    status = s;
  }
}

class DutiesList {
  int itemNumber = 0;
  int completed = 0;

  final List<Duty> checklist = [
    Duty(c: 'Equipment', i: 'Attach implements (plow, disc, drill, etc.) to tractor', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Check on product drying apparatus', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Crop baling', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Cultivate crops', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Drive and operate Farm Machinery', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Drive and operate self-propelled combine', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Drive grain trucks', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Ginning', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Harvest crops', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Hay buckling', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Husking', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Load commodities into hoppers, containers, or conveyors', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Lubricate equipment', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Maintain equipment', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Operate a baler', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Operate towed equipment to plant, fertilize, dust, or spray crops', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Operate towed equipment to spread manure', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Plant crops', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Plow soil', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Shelling', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Spread manure', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Store crops', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Threshing', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Till Soil', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Tow harvesting equipment', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Transport crops to elevator, storage area, etc.', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Use GPS autosteer systems', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Use swather', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Haul hay on hay trailer', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Load hay bales onto truck/trailer', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Use loader tractor to move manure', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Use forklift', s: false, p: Icons.agriculture),
    Duty(c: 'Equipment', i: 'Use Skid-steer loader', s: false, p: Icons.agriculture),
    Duty(c: 'General', i: 'Apply pesticides, herbicides, or fertilizers to crops', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Clean and pack product', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Clean bins', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Clear & maintain irrigation ditches', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Construct trellises', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Discard diseased or rotten products', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Harvest product by hand', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Identify pests & weeds and best means of removal', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Irrigate soil', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Load grain trucks', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Clean and Maintain yards, grounds, and facilities', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Maintain irrigation systems', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Maintain/build fences', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Mix materials and/or chemicals for planter or sprayer', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Oversee activities of work crews', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Plant product by hand', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Prune product', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Record information about crops, chemical use, and progress', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Remove weeds by hand', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Remove weeds using chemicals', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Seed cleaning', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Supervise crop farm workers', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Transplant seedlings', s: false, p: Icons.eco),
    Duty(c: 'General', i: 'Use hand tools to tend to plants', s: false, p: Icons.eco),
    Duty(c: 'Livestock', i: 'Apply/administer medications/vaccinations to livestock', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Assist with artificial insemination', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Assist with birthing/calving', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Brand livestock', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Castrate livestock', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Check/maintain cattle feed & water equipment', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Clean livestock stalls with disinfectant', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Confine livestock to stalls', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Feed livestock', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Groom livestock', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Herd livestock', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Inspect livestock for illness/injury', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Maintain breeding, feeding, and cost records', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Maintain livestock equipment', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Make hay feed', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Mix additives in feed', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Order feed for animals', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Perform embryo transfer', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Perform ultrasounds on cattle', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Place mineral blocks', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Prepare pregnant livestock for birthing/calving (wash, etc.)', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Protect livestock from predators', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Spray livestock with insecticide', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Tend to pregnant cattle', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Tend to young calves', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Transport cattle', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Weigh livestock', s: false, p: Icons.fence),
    Duty(c: 'Livestock', i: 'Collect and remove manure from livestock facilities', s: false, p: Icons.fence),
    Duty(c: 'Mechanical', i: 'Incidental Maintenance', s: false, p: Icons.construction),
    Duty(c: 'Mechanical', i: 'Incidental equipment cleaning', s: false, p: Icons.construction),
    Duty(c: 'Mechanical', i: 'Incidental repainting', s: false, p: Icons.construction),
    Duty(c: 'Mechanical', i: 'Changing oil as needed', s: false, p: Icons.construction),
    Duty(c: 'Mechanical', i: 'Equipment Disassembly & Reassembly', s: false, p: Icons.construction),
    Duty(c: 'Mechanical', i: 'Thorough Repairs', s: false, p: Icons.construction),
    Duty(c: 'Mechanical', i: 'Welding', s: false, p: Icons.construction),
    Duty(c: 'Mechanical', i: 'Fabricating', s: false, p: Icons.construction),
    Duty(c: 'Mechanical', i: 'Sanding/Grinding', s: false, p: Icons.construction),
    Duty(c: 'Winter', i: 'Construct windbreaks for livestock', s: false, p: Icons.ac_unit),
    Duty(c: 'Winter', i: 'Maintain heated watering system', s: false, p: Icons.ac_unit),
    Duty(c: 'Winter', i: 'Operate snow removal equipment', s: false, p: Icons.ac_unit),
    Duty(c: 'Winter', i: 'Break up ice in watering troughs', s: false, p: Icons.ac_unit),
  ];


  String getCategory() {
    return checklist[itemNumber].category;
  }

  String getItem() {
    return checklist[itemNumber].item;
  }

  void isCompleted(int index, bool value) {
    checklist[index].status = value;
  }

  void reset() {
    itemNumber = 0;
  }
}