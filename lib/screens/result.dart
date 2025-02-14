import 'package:flutter/material.dart';
import 'package:flutter_nic_decoder/theme/theme.dart';
import 'package:flutter_nic_decoder/controllers/nic_controller.dart';
import 'package:get/get.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TableCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class TableCard extends StatelessWidget {
  TableCard({super.key});

  // Get the existing controller
  final NicController nicController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(16),
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
            return const CircularProgressIndicator.adaptive();
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
              // Buids rows using BuildTableRow widget
              _buildTableRow(
                context, 'Serial No', nicInfo?.serialNo ?? 'N/A'),
              _buildTableRow(
                  context, 'Date of Birth', nicInfo?.birthDate ?? 'N/A'),
              _buildTableRow(
                context, 'Gender', nicInfo?.gender ?? 'N/A'),
              _buildTableRow(
                  context, 'Ability to Vote', nicInfo?.votability ?? 'N/A'),
            ],
          );
        },
      ),
    );
  }

  // Create custom rows for the table
  TableRow _buildTableRow(
    BuildContext context,
    title,
    String value,
  ) {
    final theme = Theme.of(context);

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            value,
            style: theme.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
