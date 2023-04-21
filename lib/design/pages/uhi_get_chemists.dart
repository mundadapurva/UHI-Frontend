import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:landing_page/design/widgets/uhi_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:landing_page/utils/get_auth_token.dart';

import '../../utils/config.dart';

Future<List> fetchChemists() async {
  final url = Uri.parse('${BaseUrl.baseUrl}/chemist');

  final authToken = await getAuthToken();

  final header = {'authorization': 'Bearer $authToken'};

  final response = await http.get(url, headers: header);

  final parsed = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return parsed;
  } else {
    throw Exception('Failed to load chemists');
  }
}

class UhiShowChemists extends StatefulWidget {
  const UhiShowChemists({super.key});

  @override
  State<UhiShowChemists> createState() => _UhiShowChemistsState();
}

class _UhiShowChemistsState extends State<UhiShowChemists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemists Near You'),
        centerTitle: true,
      ),
      drawer: const UhiDrawer(),
      body: FutureBuilder<List>(
        future: fetchChemists(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final results = snapshot.data!;
            // .map((e) => e['name'].toString())
            // .where((element) => element.toLowerCase())
            // .toList();
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(results[index]['firstName']),
                    subtitle: Text(results[index]['phone']),
                    onTap: () {},
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
