import 'package:flutter/material.dart';

import 'package:transport_real_time/models/bus_departure.dart';

// ignore: must_be_immutable
class DepartureView extends StatefulWidget {
  List<BusDeparture> departures;
  DepartureView({
    Key? key,
    required this.departures,
  }) : super(key: key);

  @override
  _DepartureViewState createState() => _DepartureViewState();
}

class _DepartureViewState extends State<DepartureView> {
  @override
  Widget build(BuildContext context) {
    List<BusDeparture> departures = widget.departures;

    return Expanded(
      child: ListView.builder(
          itemCount: departures.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _borderBuilder(
                        departures[index].line,
                        Colors.red,
                        false,
                      ),
                      _borderBuilder(
                        departures[index].best_departure_estimate,
                        Colors.blue,
                        true,
                      ),
                    ],
                  ),
                  Divider(),
                ],
              ),
            );
          }),
    );
  }

  Widget _borderBuilder(String text, Color color, bool isBold) {
    return Container(
      width: 68,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      ),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: color),
      padding: const EdgeInsets.all(8),
    );
  }
}
