import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SimpleCarousel extends StatefulWidget {
  const SimpleCarousel({super.key});

  @override
  State<SimpleCarousel> createState() => _SimpleCarouselState();
}

class _SimpleCarouselState extends State<SimpleCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          height: MediaQuery.of(context).size.height / 3),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(color: Colors.lightBlueAccent),
                child: Center(
                  child: Text('SLIDE $i', style: TextStyle(fontSize: 16.0)),
                ));
          },
        );
      }).toList(),
    );
  }
}
