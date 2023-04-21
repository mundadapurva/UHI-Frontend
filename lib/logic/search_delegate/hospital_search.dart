import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../utils/config.dart';
import '../../utils/get_auth_token.dart';

Future<Map<String, String>> fetchHospitals() async {
  final token = await getAuthToken();
  final headers = {
    'authorization': 'Bearer $token',
  };

  final response = await http.get(
    Uri.parse('${BaseUrl.baseUrl}/hospitals'),
    headers: headers,
  );

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body) as List<dynamic>;

    return {for (var e in parsed) e['_id'].toString(): e['name'].toString()};
  } else {
    throw Exception('Failed to load hospitals');
  }
}

class HospitalSearchDelegate extends SearchDelegate<Map<String, String>> {
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
        close(context, {});
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
      future: fetchHospitals(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final results = snapshot.data!.values
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
                    close(
                        context,
                        mp.entries
                            .where((element) => element.value == results[index])
                            .map((e) => {e.key: e.value})
                            .toList()[0]);
                    // log('Hospital ID: ${mp.keys.firstWhere((element) => mp[element] == results[index])}');
                  },
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
