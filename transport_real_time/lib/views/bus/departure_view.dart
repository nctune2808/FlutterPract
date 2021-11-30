import 'package:flutter/material.dart';

import 'package:transport_real_time/models/bus_departure.dart';

// ignore: must_be_immutable
class BusDepartureView extends StatefulWidget {
  List<BusDeparture> departures;
  BusDepartureView({
    Key? key,
    required this.departures,
  }) : super(key: key);

  @override
  _BusDepartureViewState createState() => _BusDepartureViewState();
}

class _BusDepartureViewState extends State<BusDepartureView> {
  @override
  Widget build(BuildContext context) {
    List<BusDeparture> departures = widget.departures;

    return Expanded(
      child: ListView.builder(
          itemCount: departures.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
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
