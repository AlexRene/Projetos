import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          SizedBox(height: 20),
          ListTile(leading: Icon(Icons.archive), title: Text('archive')),
          ListTile(leading: Icon(Icons.list), title: Text('Submissions')),
          ListTile(leading: Icon(Icons.numbers), title: Text('Index')),
          ListTile(leading: Icon(Icons.search), title: Text('Search')),
          ListTile(
              leading: Icon(Icons.calendar_month), title: Text('Calendar')),
          ListTile(leading: Icon(Icons.rss_feed), title: Text('RSS')),
          ListTile(leading: Icon(Icons.person), title: Text('Education')),
          ListTile(leading: Icon(Icons.info), title: Text('About APOD')),
          ListTile(leading: Icon(Icons.chat), title: Text('Discuss'))
        ],
      ),
    );
  }
}
