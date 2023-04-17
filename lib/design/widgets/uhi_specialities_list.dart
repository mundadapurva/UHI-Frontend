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
    'https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/70430/stethoscope-clipart-md.png',
    'https://media1.popsugar-assets.com/files/thumbor/XtdCkbU9GTqn_ENd4HeyXWG0IB4/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2015/11/02/688/n/37139775/24ce2bf308941ce2_0/i/Emoji-Curly-Hair-Dark-Skin-Tones.jpg',
    'https://png.pngtree.com/png-clipart/20221017/original/pngtree-women-health-woman-girl-uterus-png-image_8700849.png',
    'https://media.istockphoto.com/id/1273848577/vector/dentistry-and-healthcare-concept-white-healthy-teeth-professional-dental-care.jpg?s=612x612&w=0&k=20&c=d0iI6ln223L3hP7cwlD_jwU4Cx5dFWV-PdA-PdgxV94=',
    'https://media.istockphoto.com/id/1132530862/vector/woman-holding-newborn-baby-concept-vector-illustration-in-cute-cartoon-style-health-care.jpg?s=612x612&w=0&k=20&c=oE8NfdS8B5nFZmDDjBe2okKiw1mr2f9-hTEvNS3-yZo=',
    'https://static.vecteezy.com/system/resources/thumbnails/013/976/279/small/ophthalmologist-checking-patient-eyesight-using-slit-lamp-eye-doctors-oculists-appointment-eye-care-checkup-flat-illustration-vector.jpg',
    'https://images.squarespace-cdn.com/content/v1/59587c75579fb36141f56296/1504496191070-4N9PPFTDZBXH642WYRLC/SocialMediaLogo.png',
    'https://thumbs.dreamstime.com/b/knee-joint-side-view-human-vector-illustration-88405057.jpg',
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
                          child: Image.network(
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
