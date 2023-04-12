import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://blog.gratefulness.me/content/images/2021/07/April-28-Quote.jpg',
  'https://blog.gratefulness.me/content/images/2021/07/April-27-Quote.jpg',
  'https://wow4u.com/wp-content/uploads/1health.jpg',
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
                    child: Image.network(
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
