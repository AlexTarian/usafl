import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usafl/components/vehicle_picker.dart';

void main() {
  testWidgets('VehiclePicker test', (WidgetTester tester) async {
    // Create a TextEditingController to simulate the vehicleCount
    TextEditingController vehicleCountController = TextEditingController();
   
    // Create a List to simulate the vehicleList
    List vehicleList = [];

    // Build the VehiclePicker widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VehiclePicker(
          vehicleCount: vehicleCountController,
          vehicleList: vehicleList,
        ),
      ),
    ));

    // Check if the "Add a Vehicle" title is displayed
    expect(find.text('Add a Vehicle'), findsOneWidget);

    // Check if the required input fields and buttons are displayed
    expect(find.byType(ApplicationTextField), findsNWidgets(4));
    expect(find.byType(DropdownButton), findsOneWidget);
    expect(find.byType(TextButton), findsNWidgets(4));

    // Check if the initial state of the dropdown button is "Vehicle Type"
    expect(find.text('Vehicle Type'), findsOneWidget);

    // Simulate adding a vehicle
    await tester.enterText(find.widgetWithText(ApplicationTextField, 'Make').first, 'Toyota');
    await tester.enterText(find.widgetWithText(ApplicationTextField, 'Model').first, 'Camry');
    await tester.enterText(find.widgetWithText(ApplicationTextField, 'Year').first, '2022');
    await tester.enterText(find.widgetWithText(ApplicationTextField, 'Seats').first, '5');
    await tester.tap(find.text('Vehicle Type').hitTestable());
    await tester.pumpAndSettle();
    await tester.tap(find.text('Car').hitTestable());
    await tester.pumpAndSettle();

    // Tap the 'Add' button
    await tester.tap(find.widgetWithText(TextButton, 'Add'));
    await tester.pumpAndSettle();

    // Check if the vehicle has been added to the list
    expect(find.text('2022 Toyota Camry'), findsOneWidget);
    expect(find.text('5 Seats'), findsOneWidget);
  });
}
