import 'package:flutter/material.dart';
import 'package:usafl/views/application_selection_screen.dart';
import 'package:usafl/components/custom_app_bar.dart';
import 'package:usafl/components/nav_menu.dart';
import 'package:usafl/components/application_list.dart';

ApplicationForm appEngine = const ApplicationForm();
late DateTime selectedDate;

class ApplicationViewer extends StatefulWidget {
  const ApplicationViewer({super.key});

  initState() {
    selectedDate = DateTime.now();
  }

  @override
  State<ApplicationViewer> createState() => _ApplicationViewerState();
}

class _ApplicationViewerState extends State<ApplicationViewer> {
  // void processAnswer() {
  //   FocusScopeNode currentFocus = FocusScope.of(context);
  //   if (!currentFocus.hasPrimaryFocus) {
  //     currentFocus.unfocus();
  //   }
  //   if (_formKey.currentState!.validate()) {
  //     if (appEngine.isFinished() == false) {
  //       appEngine.nextQuestion();
  //       _formKey.currentState!.reset();
  //     }
  //   } else {
  //     Alert(
  //       context: context,
  //       title: 'Error',
  //       desc: appEngine.getErrorMessage(),
  //       buttons: [
  //         DialogButton(
  //           color: usaflBlue,
  //           child: const Text('Okay',
  //             style: TextStyle(color: Colors.white, fontSize: 20.0),
  //           ),
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //         ),
  //       ],
  //     ).show();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const NavDrawer(),
      drawerEnableOpenDragGesture: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: Builder(builder: (context) {
          return customAppBar(
            iconR: Icons.help,
            onPressedR: () {
              null;
            },
          );
        }),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColorDark,
              ],
            ),
          ),
          child: SafeArea(
            minimum: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          pageNum = 0;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (ApplicationScreen())));
                      },
                      child: Row(
                        children: const <Widget>[
                          Icon(Icons.arrow_back, size: 30.0),
                          SizedBox(width: 10.0),
                          Text('Back to Applications',
                              style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Theme.of(context).primaryColor.withOpacity(0.5),
                              Colors.transparent
                            ],
                            stops: <double>[ pageNum / pageTotal , pageNum / pageTotal],
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 3),
                        ),
                        child: Center(
                          child: Text('PROGRESS',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w700)),
                        )),
                    const SizedBox(height: 20.0),
                  ],
                ),
                const Expanded(child: ApplicationForm()),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: TextButton(
                            child: Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Center(
                                child: Text(
                                  'Back',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                pController.animateToPage(
                                    pController.page!.toInt() - 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeOut);
                                pageNum > 0 ? pageNum-- : '';
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Flexible(
                          flex: 1,
                          child: TextButton(
                            child: Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                pController.animateToPage(
                                    pController.page!.toInt() + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeOut);
                                pageNum < pageTotal ? pageNum++ : '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
