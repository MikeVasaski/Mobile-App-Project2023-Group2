import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('A'),
            subtitle: Text('a@example.com'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('B'),
            subtitle: Text('b@example.com'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('C'),
            subtitle: Text('c@example.com'),
          ),
        ],
      ),
    );
  }
}