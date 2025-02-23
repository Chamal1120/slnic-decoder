import 'package:flutter/material.dart';
import 'package:slnic_decoder/theme/theme.dart';
import 'package:slnic_decoder/controllers/nic_controller.dart';
import 'package:get/get.dart';

/// Displays the result of decoding the NIC number.
///
/// This screen shows a success message and a table with the decoded NIC information
/// (ID, format, serial number, etc.). It also provides a button to navigate back to the previous page.
class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: catppuccinMochaGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: 150.0,
                    color: mocha.green,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Decode Success!'),
                  SizedBox(
                    height: 40.0,
                  ),
                  TableCard(),
                  SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Go Back'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A widget that displays the decoded NIC information in a table format.
///
/// The table includes rows for various pieces of NIC data such as the ID number,
/// format, serial number, date of birth, weekday of birth, age, gender, and
/// voting eligibility. It dynamically updates based on the state of the `nicController`.
class TableCard extends StatelessWidget {
  TableCard({super.key});

  /// The controller that manages the state for the NIC decoding process.
  final NicController nicController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: mocha.crust,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      // Load the values based on state variables of nicController
      child: Obx(
        () {
          if (nicController.isLoading.value) {
            return SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          final nicInfo = nicController.nicInfo.value;
          return Table(
            columnWidths: {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
            },
            border: TableBorder(
              horizontalInside: BorderSide(color: theme.dividerColor, width: 1),
            ),
            children: [
              // Builds rows using BuildTableRow widget
              _buildTableRow(context, 'ID No', nicInfo?.nicNo ?? 'N/A'),
              _buildTableRow(context, 'Format', nicInfo?.format ?? 'N/A'),
              _buildTableRow(context, 'Serial No', nicInfo?.serialNo ?? 'N/A'),
              _buildTableRow(context, 'Date of Birth', nicInfo?.birthDate ?? 'N/A'),
              _buildTableRow(context, 'WeekDay of Birth', nicInfo?.weekDay ?? 'N/A'),
              _buildTableRow(context, 'Age', nicInfo?.age ?? 'N/A'),
              _buildTableRow(context, 'Gender', nicInfo?.gender ?? 'N/A'),
              _buildTableRow(context, 'Ability to Vote', nicInfo?.votability ?? 'N/A'),
            ],
          );
        },
      ),
    );
  }

  /// Builds a single row for the NIC data table.
  ///
  /// **Parameters:**
  /// - `context`: The `BuildContext` used to access the theme.
  /// - `title`: The label for the table row (e.g., 'ID No').
  /// - `value`: The value to display in the row (e.g., '12345').
  ///
  /// Returns a `TableRow` widget that displays the title and value in the row.
  TableRow _buildTableRow(
    BuildContext context,
    String title,
    String value,
  ) {
    final theme = Theme.of(context);

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: theme.textTheme.displayMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            value,
            style: theme.textTheme.displayMedium
                ?.copyWith(fontWeight: FontWeight.w400, fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}

