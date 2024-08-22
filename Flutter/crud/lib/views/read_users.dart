import 'package:crud/controllers/read_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/user.dart';

class ReadUsers extends StatefulWidget {
  const ReadUsers({super.key});

  @override
  State<ReadUsers> createState() => _ReadUsersState();
}

class _ReadUsersState extends State<ReadUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All users'),
        actions: [
          IconButton(
            onPressed: () => context.go('/'),
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;

            return ListView(children: users.map(buildUser).toList());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
