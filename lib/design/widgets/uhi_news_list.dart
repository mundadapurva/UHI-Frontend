import 'package:flutter/material.dart';

class UhiNewsList extends StatelessWidget {
  UhiNewsList({super.key});
  List<int> n = [0, 1, 2, 3, 4, 5, 6, 7, 8];

  List<String> news = [
    'India on Thursday reports over 12,500 new COVID-19 cases as infections see 20% jump',
    'Amid a rise in COVID-19 cases, the Kerala government made masks mandatory for elderly people and pregnant women',
    'Amid a surge in H3N2 and COVID-19 cases, investing in a robust health insurance plan can protect you against rising medical costs',
    'Conjunctivitis is reportedly among the newer Covid-19 symptoms of the Omicron subvariant XBB.1.16'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < 4; i++)
          Card(
            elevation: 4,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  news[i],
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
