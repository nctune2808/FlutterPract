import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'table_cell.dart';
import 'constants.dart';

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
          Duration(seconds: 2),
        );
      },
      child: Row(
        children: [
          Container(
            width: cellWidth,
            child: ListView.builder(
              controller: _firstColumnController,
              itemCount: 20,
              itemBuilder: (context, index) {
                return MultiplicationTableCell(
                    0, index, Colors.yellow.withOpacity(0.3));
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _restColumnsController,
              child: Container(
                height: cellHeight * maxNumber,
                child: ListView.builder(
                  controller: widget.scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, x) => SizedBox(
                      width: cellWidth,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 20,
                          itemBuilder: (context, y) => Row(children: [
                                MultiplicationTableCell(x, (y), Colors.white)
                              ]))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
