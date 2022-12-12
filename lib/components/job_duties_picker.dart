import 'package:flutter/material.dart';
import 'package:usafl/components/duties_list.dart';

class ApplicationDutyPicker extends StatefulWidget {
  const ApplicationDutyPicker({
    super.key,
    required this.jobDescription,
    required this.jobDescriptionEditor,
    required this.taskList,
    required this.allTasks,
    required this.aeoTasks,
    required this.genTasks,
    required this.livTasks,
    required this.mecTasks,
    required this.winTasks,
  });

  final TextEditingController jobDescription;
  final TextEditingController jobDescriptionEditor;
  final List<bool> taskList;
  final TextEditingController allTasks;
  final TextEditingController aeoTasks;
  final TextEditingController genTasks;
  final TextEditingController livTasks;
  final TextEditingController mecTasks;
  final TextEditingController winTasks;

  @override
  State<ApplicationDutyPicker> createState() => _ApplicationDutyPickerState();
}

class _ApplicationDutyPickerState extends State<ApplicationDutyPicker> {
  int tasks = 0;
  int aeo = 0;
  int gen = 0;
  int liv = 0;
  int mec = 0;
  int win = 0;

  @override
  void initState() {
    tasks = (widget.allTasks.text == '' ? 0 : int.tryParse(widget.allTasks.text))!;
    aeo = (widget.aeoTasks.text == '' ? 0 : int.tryParse(widget.aeoTasks.text))!;
    gen = (widget.genTasks.text == '' ? 0 : int.tryParse(widget.genTasks.text))!;
    liv = (widget.livTasks.text == '' ? 0 : int.tryParse(widget.livTasks.text))!;
    mec = (widget.mecTasks.text == '' ? 0 : int.tryParse(widget.mecTasks.text))!;
    win = (widget.winTasks.text == '' ? 0 : int.tryParse(widget.winTasks.text))!;
    super.initState();
    //_isChecked = List<bool>.filled(DutiesList().checklist.length,true);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .6,
      width: MediaQuery.of(context).size.width * .8,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: DutiesList().checklist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                top:
                    BorderSide(width: 2, color: Theme.of(context).primaryColor),
              ),
            ),
            child: CheckboxListTile(
              title: Text(
                DutiesList().checklist[index].item,
                style: const TextStyle(fontSize: 18.0),
              ),
              secondary: Icon(DutiesList().checklist[index].picture,
                  color: Theme.of(context).primaryColor),
              value: widget.taskList[index],
              activeColor: Theme.of(context).primaryColor,
              onChanged: (value) {
                String category = DutiesList().checklist[index].category;
                setState(() {
                  widget.taskList[index] = value!;

                  if (value) {
                    tasks++;
                    widget.jobDescription.text =
                        '${widget.jobDescription.text.replaceRange(widget.jobDescription.text.length - 1, widget.jobDescription.text.length, tasks == 1 ? '' : ';')} ${DutiesList().checklist[index].item}.';
                    if (category == 'Equipment') {
                      aeo++;
                    } else if (category == 'General') {
                      gen++;
                    } else if (category == 'Livestock') {
                      liv++;
                    } else if (category == 'Mechanical') {
                      mec++;
                    } else if (category == 'Winter') {
                      win++;
                    }
                  } else {
                    tasks--;
                    widget.jobDescription.text = widget.jobDescription.text
                        .replaceAll(
                            '${DutiesList().checklist[index].item}; ', '')
                        .replaceAll(
                            '${DutiesList().checklist[index].item}.', '');
                    if (category == 'Equipment') {
                      aeo--;
                    } else if (category == 'General') {
                      gen--;
                    } else if (category == 'Livestock') {
                      liv--;
                    } else if (category == 'Mechanical') {
                      mec--;
                    } else if (category == 'Winter') {
                      win--;
                    }
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}
