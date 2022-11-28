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
            '',
            '',
            Colors.yellow.withOpacity(0.4),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: datas.length,
              itemBuilder: (context, index) {
                return MultiplicationTableCell(
                  '0',
                  datas[index].staff,
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
