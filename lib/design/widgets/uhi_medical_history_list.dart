import 'package:flutter/material.dart';

class UhiMedicalHistoryList extends StatelessWidget {
  UhiMedicalHistoryList({super.key});
  List<int> n = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  List<String> name = [
    'John',
    'Shaun',
    'John',
    'Shaun',
    'John',
    'Shaun',
  ];
  List<String> symptoms = [
    'vomitings',
    'fainting',
    'vomitings',
    'fainting',
    'vomitings',
    'fainting',
  ];
  List<String> diagnosis = [
    'diaoheria',
    'anameia',
    'diaoheria',
    'anameia',
    'diaoheria',
    'anameia',
  ];
  List<String> fees = [
    '300',
    '500',
    '300',
    '500',
    '300',
    '500',
  ];
  List<String> cure = [
    'antibiotics',
    'multivitamins',
    'antibiotics',
    'multivitamins',
    'antibiotics',
    'multivitamins',
  ];
  List<String> homeremedies = [
    'drink sugar-salt water',
    'eat iron rich food',
    'drink sugar-salt water',
    'eat iron rich food',
    'drink sugar-salt water',
    'eat iron rich food',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < 5; i++)
          Card(
            elevation: 4,
            child: Container(
              height: 180,
              width: double.infinity,
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Patient name: ' + name[i],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Symptoms: ' + symptoms[i],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Diagnosis: ' + diagnosis[i],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Fees: ' + fees[i],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Cure: ' + cure[i],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Home remedies: ' + homeremedies[i],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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
