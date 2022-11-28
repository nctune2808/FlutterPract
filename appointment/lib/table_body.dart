import 'package:appointment/data.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'table_cell.dart';
import 'constants.dart';
import 'time.dart';

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
        children: [
          Container(
            width: cellWidth,
            child: ListView.builder(
              controller: _firstColumnController,
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemCount: times.length,
              itemBuilder: (context, index) {
                return MultiplicationTableCell(
                    'TIME', times[index].time, Colors.yellow.withOpacity(0.1));
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _restColumnsController,
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              child: Container(
                height: cellHeight * times.length,
                child: ListView.builder(
                    controller: widget.scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    shrinkWrap: true,
                    itemCount: datas.length,
                    itemBuilder: (context, x) => SizedBox(
                        width: cellWidth,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: times.length,
                            itemBuilder: (context, y) {
                              bool isMatched =
                                  _checkMatch(datas[x], times[y], x, y);
                              return Row(children: [
                                MultiplicationTableCell(
                                    x.toString(),
                                    y.toString(),
                                    isMatched
                                        ? Colors.lightBlue.shade100
                                        : Colors.white)
                              ]);
                            }))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _checkMatch(Data d, Time t, int x, int y) {
    if (d.time == t.time) {
      return (d.time == t.time && d.id == x);
    }
    return false;
  }
}
