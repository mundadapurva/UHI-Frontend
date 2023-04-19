import 'package:flutter/material.dart';

class UhiBookBed extends StatefulWidget {
  const UhiBookBed({super.key});

  @override
  State<UhiBookBed> createState() => _UhiBookBedState();
}

class _UhiBookBedState extends State<UhiBookBed> {
  final TextEditingController _searchController = TextEditingController();
  String dropdownvalue = 'GENERAL';

  // List of items in our dropdown menu
  var items = [
    'GENERAL',
    'SEMI-PRIVATE',
    'PRIVATE',
    'ICU',
    'NICU',
    'PICU',
    'CCU',
    'HDU',
    'OTHERS',
  ];
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // Add padding around the search bar
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              // Use a Material design search bar
              child: TextField(
                style: const TextStyle(fontSize: 13),
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'SEARCH HOSPITAL',
                  // Add a clear button to the search bar
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Perform the search here
                    },
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'SELECT WARD TYPE',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.topLeft,
              // margin: const EdgeInsets.all(3),
              // padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items, style: const TextStyle(fontSize: 13)),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'CONTACT',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your contact';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                hintText: 'Enter your contact',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(5),
                counter: Offstage(),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text(
                  'NEED AMBULANCE?',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: isChecked ? 15 : 0),
            isChecked
                ? const Text(
                    'ADDRESS',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                : Container(),
            isChecked
                ? TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: 'Enter your address',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                    ),
                  )
                : Container(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Book Bed',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
