import 'package:flutter/material.dart';
import 'package:flutter_nic_decoder/theme/theme.dart';

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
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [TableCard()],
          ),
        ),
      ),
    );
  }
}

class TableCard extends StatelessWidget {
  const TableCard({super.key});

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
      child: Table(
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1),
        },
        border: TableBorder(
          horizontalInside: BorderSide(color: theme.dividerColor, width: 1),
        ),
        children: [

          // Buids rows using BuildTableRow widget
          _buildTableRow(context, 'Serial', '0937'),
          _buildTableRow(context, 'Date of Birth', '1985/12/05'),
          _buildTableRow(context, 'Gender', 'Male'),
          _buildTableRow(context, 'Ability to vote', 'Yes'),
        ],
      ),
    );
  }

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
