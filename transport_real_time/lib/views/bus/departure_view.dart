import 'package:flutter/material.dart';

import 'package:transport_real_time/models/bus_departure.dart';

class BusDepartureView extends StatelessWidget {
  List<BusDeparture> departures;
  BusDepartureView({
    Key? key,
    required this.departures,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  ),
                  _borderBuilder(
                      departures[index].best_departure_estimate, Colors.blue)
                ],
              ),
            );
          }),
    );
  }

  Widget _borderBuilder(String text, Color color) {
    return Container(
      child: Text(text, style: const TextStyle(color: Colors.white)),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: color),
      padding: const EdgeInsets.all(10),
    );
  }
}
