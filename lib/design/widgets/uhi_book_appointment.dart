import 'package:flutter/material.dart';
import 'package:landing_page/design/widgets/uhi_specialities_list.dart';

import '../../logic/search_delegate/speciality_search.dart';

class UhiBookAppointment extends StatefulWidget {
  const UhiBookAppointment({super.key, required this.userId});

  final String userId;

  @override
  State<UhiBookAppointment> createState() => _UhiBookAppointmentState();
}

class _UhiBookAppointmentState extends State<UhiBookAppointment> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                // Add padding around the search bar
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                // Use a Material design search bar
                child: TextField(
                  style: const TextStyle(fontSize: 13),
                  controller: _searchController,
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: SpecialtySearchDelegate(),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Symptoms/Specialities',
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const Text('Most searched specialities',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
              const SizedBox(height: 20),
              UhiSpecialitiesList(),
            ],
          ),
        ),
      ),
    );
  }
}
