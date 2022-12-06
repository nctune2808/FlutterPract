import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'data/constants.dart';
import 'data/data.dart';
import 'data/time.dart';
import 'table_cell.dart';

class TableBody extends StatefulWidget {
  final ScrollController scrollController;

  TableBody({
    required this.scrollController,
  });

  @override
  _TableBodyState createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _firstColumnController;
  late ScrollController _restColumnsController;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _firstColumnController = _controllers.addAndGet();
    _restColumnsController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _firstColumnController.dispose();
    _restColumnsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMatched = false;
    return RefreshIndicator(
      notificationPredicate: (ScrollNotification notification) {
        return notification.depth == 0 || notification.depth == 1;
      },
      onRefresh: () async {
        await Future.delayed(
          Duration(seconds: 1),
        );
      },
      child: Row(
        // Row by Row
        children: [
          Container(
            width: cellWidth,
            child: ListView.builder(
              // List Vertical
              controller: _firstColumnController,
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemCount: times.length,
              itemBuilder: (context, index) {
                return MultiplicationTableCell(
                    0, 0, null, times[index], Colors.yellow.withOpacity(0.1));
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              // Default Vertical - Main
              controller: _restColumnsController,
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              child: Container(
                height: cellHeight * 2 * times.length,
                child: ListView.builder(
                  // List Horizontal  - X Axis
                  controller: widget.scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  shrinkWrap: true,
                  itemCount: datas.length,
                  itemBuilder: (context, x) => SizedBox(
                    width: cellWidth,
                    child: Stack(children: [
                      ListView.builder(
                        // List Vertical  - Y
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: times.length,
                        itemBuilder: (context, y) {
                          isMatched = _checkMatch(datas[x], times[y], x, y);
                          return Row(
                            children: [
                              // Row By Row
                              MultiplicationTableCell(
                                  x,
                                  y,
                                  (datas[x]),
                                  (times[y]),
                                  isMatched
                                      ? Colors.lightBlue.shade100
                                      : Colors.white)
                            ],
                          );
                        },
                      ),
                      Positioned(
                        top:
                            (100 * x + datas[x].time.minute * 5 / 3).toDouble(),
                        height: (datas[x].d * (cellHeight)),
                        child: Container(
                            width: cellWidth - 8,
                            height: cellHeight - 8,
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              border: Border.all(
                                color: Colors.black12,
                                width: 0.5,
                              ),
                            ),
                            child: ListTile(
                                dense: true,
                                onTap: () => {print('clicked')},
                                title: Text(x.toString()))),
                      ),

                      // Positioned(
                      //   top: (20 * datas[x].d),
                      //   height: 50 + datas[x].d,
                      //   child: Container(
                      //       width: cellWidth,
                      //       height: cellHeight,
                      //       padding: EdgeInsets.zero,
                      //       alignment: Alignment.center,
                      //       margin: EdgeInsets.all(5),
                      //       decoration: BoxDecoration(
                      //         color: Colors.yellow.shade500,
                      //         border: Border.all(
                      //           color: Colors.black12,
                      //           width: 0.5,
                      //         ),
                      //       ),
                      //       child: ListTile(
                      //           onTap: () => {print('clicked')},
                      //           title: Text(x.toString()))),
                      // ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _checkMatch(Data d, Time t, int x, int y) {
    if (d.time.hour == t.hour) {
      return (d.time.hour == t.hour && d.id == x);
    }
    return false;
  }
}

// Container(
// width: cellWidth,
// height: cellHeight,
// padding: EdgeInsets.zero,
// alignment: Alignment.center,
// margin: EdgeInsets.all(5),
// decoration: BoxDecoration(
//   color: Colors.yellow.shade500,
//   border: Border.all(
//     color: Colors.black12,
//     width: 0.5,
//   ),
// ),
// child: ListTile(
//     onTap: () => {print('clicked')},
//     title: Text(x.toString()))),