import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/Quote1.png',
  'assets/images/Quote2.png',
  'assets/images/Quote3.png',
];

class UhiCarousel extends StatelessWidget {
  const UhiCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
        ),
        CarouselSlider(
          items: imgList
              .map((item) => Center(
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
