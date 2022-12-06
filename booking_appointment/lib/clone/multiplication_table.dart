import 'package:booking_appointment/data/constants.dart';
import 'package:flutter/material.dart';

class MultiplicationTable extends StatefulWidget {
  @override
  _MultiplicationTableState createState() => _MultiplicationTableState();
}

class _MultiplicationTableState extends State<MultiplicationTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Stack(children: [
          Wrap(
            direction: Axis.vertical,
            children: List.generate(32, (index) {
              return Container(
                height: 100,
                width: 100,
                child: new Column(
                  children: [
                    new Expanded(
                      child: Card(
                          child: ListTile(
                              title: Text(index.toString()))), //your card wight
                    ),
                  ],
                ),
              );
            }),
          ),
          Wrap(
            direction: Axis.vertical,
            children: List.generate(32, (index) {
              int varData = index;
              return DragTarget(
                  onWillAccept: (data) {
                    return true;
                  },
                  onAccept: (data) {},
                  onLeave: (data) {
                    setState(() {
                      varData = int.parse(data.toString());
                    });
                    print(varData);
                  },
                  builder: (context, candidateData, rejectedData) => Container(
                        child: Draggable(
                          // onDragCompleted: () {
                          //   setState(() {
                          //     varData = index;
                          //   });
                          // },
                          data: index,
                          feedback: Container(
                            height: 100,
                            width: 100,
                            child: new Column(
                              children: [
                                new Expanded(
                                  child: Card(
                                      color: Colors.amber.shade100,
                                      child: ListTile(
                                          title: Text(varData
                                              .toString()))), //your card wight
                                ),
                              ],
                            ),
                          ),
                          childWhenDragging: Container(
                              height: 100,
                              width: 100,
                              child: new Column(children: [
                                new Expanded(
                                  child: Card(
                                      // color: Colors.amber,
                                      child: ListTile(
                                          title: Text(varData
                                              .toString()))), //your card wight
                                ),
                              ])),
                          child: Container(
                            height: 100,
                            width: 100,
                            child: new Column(
                              children: [
                                new Expanded(
                                  child: Card(
                                      color: Colors.amber,
                                      child: ListTile(
                                          onTap: (() {
                                            print(varData);
                                          }),
                                          title: Text(varData
                                              .toString()))), //your card wight
                                ),
                              ],
                            ),
                          ),
                        ),
                      ));
            }),
          ),
        ]));
  }
}

// DragTarget<String>(
//                     builder: (
//                       BuildContext context,
//                       List<dynamic> accepted,
//                       List<dynamic> rejected,
//                     ) {
//                       return Wrap(
//                         direction: Axis.vertical,
//                         children: List.generate(32, (index) {
//                           return Container(
//                             height: 100,
//                             width: 100,
//                             child: new Column(
//                               children: [
//                                 new Expanded(
//                                   child: Card(
//                                       child: ListTile(
//                                           title: Text(index
//                                               .toString()))), //your card wight
//                                 ),
//                               ],
//                             ),
//                           );
//                         }),
//                       );
//                     },
//                     onWillAccept: (data) {
//                       print(data);
//                       return false;
//                     },
//                     onAccept: (data) {
//                       print(data);
//                     },
//                   )