import 'package:usafl/components/item.dart';

class AuditChecklist {
  int itemNumber = 0;
  int completed = 0;

  final List<Item> checklist = [
    Item(c: 'Audit',
        i: 'Obtain a copy of the Initial Recruitment Report completed during the application process (available upon request from USAFL).',
        v: false),
    Item(c: 'Audit',
        i: 'Complete and obtain a copy of the Final Recruitment Report half-way through the job period (available upon request from USAFL).',
        v: false),
    Item(c: 'Audit',
        i: 'If work contracts were given to workers, collect copies of all work contracts.',
        v: false),
    Item(c: 'Audit',
        i: 'If work contracts were NOT given to workers, verify that workers were given a copy of the Job Order once they accepted the job.',
        v: false),
    Item(c: 'Audit',
        i: 'Collect documentation showing that workers are covered by Workers\' Compensation at every worksite throughout the job.',
        v: false),
    Item(c: 'Audit',
        i: 'Collect documentation showing that worksites are owned or controlled by your company (e.g., leases, title deeds, utility bills, etc.).',
        v: false),
    Item(c: 'Audit',
        i: 'Collect evidence that all workers were reimbursed for their consulate fees upon arrival.',
        v: false),
    Item(c: 'Audit',
        i: 'Collect evidence that all workers were reimbursed for their travel expenses (e.g., flight ticket costs) upon arrival.',
        v: false),
    Item(c: 'Audit',
        i: 'Collect evidence that all workers were reimbursed for their travel subsistence costs (daily amount set by government) upon arrival.',
        v: false),
    Item(c: 'Audit',
        i: 'Collect evidence that all workers were reimbursed for their outbound travel expenses (e.g., flight ticket costs) no later than at the end of the job.',
        v: false),
    Item(c: 'Audit',
        i: 'Collect evidence that all workers were reimbursed for their outbound subsistence costs (daily amount set by government) at the end of the job.',
        v: false),
    Item(c: 'Audit',
        i: 'Collect records of each worker\'s earnings, broken down by pay period.',
        v: false),
    Item(c: 'Audit',
        i: 'Earnings records must note each workers\' first and last day of work.',
        v: false),
    Item(c: 'Audit',
        i: 'Earnings records must include each workers\' name and permanent home address in his/her country of origin.',
        v: false),
    Item(c: 'Audit',
        i: 'Earnings records must include your business\'s FEIN number.',
        v: false),
    Item(c: 'Audit',
        i: 'Earnings records must include the number of hours offered each day to ensure you met the 3/4 Guarantee.',
        v: false),
    Item(c: 'Audit',
        i: 'Earnings records must include the number of hours actually worked each day.',
        v: false),
    Item(c: 'Audit',
        i: 'Earnings records must include each worker\'s rate of pay.',
        v: false),
    Item(c: 'Audit',
        i: 'Earnings records must note each worker\'s total earnings for each pay period',
        v: false),
    Item(c: 'Audit',
        i: 'Earnings records must note any and all deductions, along with reasons for those deductions. If there were no deductions, the records should note that.',
        v: false),
    Item(c: 'Audit',
        i: 'Earnings records must note and explain any differences in wages between workers performing the same job duties.',
        v: false),
    Item(c: 'Audit',
        i: 'Earnings records must note and explain any differences between the wage rate listed in the Job Order and the wage rate actually paid.',
        v: false),
    Item(c: 'Audit',
        i: 'If you did not hire the number of workers you originally requested, you must note the reason on the earnings records.',
        v: false),
    Item(c: 'Audit',
        i: 'Collect documentation that shows you contractually forbade your agent from charging fees to workers (available upon request from USAFL).',
        v: false),
    Item(c: 'Audit',
        i: 'Collect copies of all Approved Job Orders (ETA Form 790) (available upon request from USAFL).',
        v: false),
    Item(c: 'Audit',
        i: 'Collect copies of all Applications for Temporary Labor Certification (ETA Form 9142A & attachments) (available upon request from USAFL).',
        v: false),
    Item(c: 'Audit',
        i: 'Collect copies of all H-2A Temporary Labor Certifications (available upon request from USAFL).',
        v: false),
    Item(c: 'Audit',
        i: 'Collect all records of employees (H-2A and non-H-2A) who left your employment in the last two years, including the reason for departure.',
        v: false),
    Item(c: 'Audit',
        i: 'Collect copies of all contracts with recruiters/H-2A assistance agencies (available upon request from USAFL).',
        v: false),
    Item(c: 'Audit',
        i: 'If you are a Farm Labor Contractor, collect all work contracts with businesses you performed services for with the help of H-2A workers.',
        v: false),
    Item(c: 'Audit',
        i: 'If you are a Farm labor Contractor, collect copies of your FLC and FLCE Registration cards.',
        v: false),
    Item(c: 'Audit',
        i: 'If you are a Farm Labor Contractor, collect copies of your surety bond.',
        v: false),
    Item(c: 'Audit',
        i: 'Collect information and earnings records for all non-H-2A employees and independent contractors who performed services for you.',
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