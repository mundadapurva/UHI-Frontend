import 'package:flutter/material.dart';

class UhiSpecialitiesList extends StatelessWidget {
  UhiSpecialitiesList({super.key});
  List<int> n = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  List<String> specialities = [
    'General Physician',
    'Skin & Hair',
    "Women's Health",
    'Dental Care',
    'Child Specialist',
    'Eye Specialist',
    'ENT Specialist',
    'Bones & Joints',
  ];
  List<String> specialitiesImages = [
    'assets/images/Stethescope.png',
    'assets/images/Hair.png',
    'assets/images/Woman.png',
    'assets/images/Dental.png',
    'assets/images/Child.png',
    'assets/images/Eye.png',
    'assets/images/ENT.png',
    'assets/images/Bone.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < 8; i++)
          Card(
            elevation: 4,
            child: SingleChildScrollView(
              child: Container(
                height: 75,
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          child: Image.asset(
                            specialitiesImages[i],
                            height: 56,
                            width: 56,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          specialities[i],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
