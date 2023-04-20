import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/get_auth_token.dart';

Future<List<String>> fetchSpecialties() async {
  final token = await getAuthToken();

  final headers = {
    'authorization': 'Bearer $token',
  };
  final response = await http.get(Uri.parse('http://localhost:3000/doctors'),
      headers: headers);
  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body) as List<dynamic>;

    return parsed.map((e) => e['firstName'].toString()).toList();
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
    return FutureBuilder<List<String>>(
      future: fetchSpecialties(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final results = snapshot.data!
              .where((element) => element.toLowerCase().contains(query))
              .toList();
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(results[index]),
                  onTap: () {
                    close(context, results[index]);
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
