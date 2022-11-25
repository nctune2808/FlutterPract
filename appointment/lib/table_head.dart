import 'package:flutter/material.dart';

import 'table_cell.dart';
import 'constants.dart';

class TableHead extends StatelessWidget {
  final ScrollController scrollController;

  TableHead({
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cellWidth,
      child: Row(
        children: [
          MultiplicationTableCell(
            0,
            0,
            Colors.yellow.withOpacity(0.3),
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(maxNumber - 1, (index) {
                return MultiplicationTableCell(
                  0,
                  index,
                  Colors.yellow.withOpacity(0.3),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
