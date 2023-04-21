import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../design/widgets/uhi_book_time.dart';
import '../../utils/config.dart';
import '../../utils/get_auth_token.dart';

Future<Map<String, String>> fetchSpecialties() async {
  final token = await getAuthToken();

  final headers = {
    'authorization': 'Bearer $token',
    'Content-Type': 'application/json'
  };
  final response = await http.get(
    Uri.parse('${BaseUrl.baseUrl}/doctors'),
    headers: headers,
  );
  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body) as List<dynamic>;
    log(parsed.toString());
    return {
      for (var e in parsed)
        e['doctorLicId'].toString(): e['firstName'].toString()
    };
  } else {
    throw Exception('Failed to load specialties');
  }
}

class SpecialtySearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: fetchSpecialties(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final results = snapshot.data!.values
              .where((element) => element.toLowerCase().contains(query))
              .toList();
          final keys = snapshot.data!.keys
              .where((element) => element.toLowerCase().contains(query))
              .toList();
          final mp = snapshot.data!;
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(results[index]),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => AppointmentsHome(
                          doctorName: results[index],
                          docId: keys[index],
                        ),
                      ),
                    );
                    // close(context, results[index]);
                    // push to time screen
                  },
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Text('Error');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
