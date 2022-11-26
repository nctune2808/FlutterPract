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
      height: cellHeight,
      child: Row(
        children: [
          MultiplicationTableCell(
            0,
            0,
            Colors.yellow.withOpacity(0.3),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return MultiplicationTableCell(
                  0,
                  index,
                  Colors.yellow.withOpacity(0.3),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
