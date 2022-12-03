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
          Container(
            width: cellWidth,
            height: cellHeight,
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.1),
              border: Border.all(
                color: Colors.black12,
                width: 1.0,
              ),
            ),
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
                  return Container(
                    width: cellWidth,
                    height: cellHeight,
                    decoration: BoxDecoration(
                      color: Colors.yellow.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.black12,
                        width: 1.0,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: ListTile(
                      onTap: () => print("${datas[index].staff}"),
                      title: Text(
                        '${datas[index].staff}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
