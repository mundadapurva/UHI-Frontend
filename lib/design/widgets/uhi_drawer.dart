import 'package:flutter/material.dart';

class UhiDrawer extends StatelessWidget {
  const UhiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: const [
                ClipRRect(
                  child: Image(
                    image: NetworkImage(
                        'https://elitehealthswfl.org/wp-content/uploads/2018/10/heart-illustration.png'),
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.history_outlined),
              title: const Text('History'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.medication_outlined),
              title: const Text('Chemist'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.security_outlined),
              title: const Text('Insurance'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
