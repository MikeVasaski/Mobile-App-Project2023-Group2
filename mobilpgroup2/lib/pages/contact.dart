import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text('Contact'),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Jeerasak Tarat'),
            subtitle: Text('jeerasak_tarat@cmu.ac.th'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Padungkiat Leksri'),
            subtitle: Text('padungkiat_leksri@cmu.ac.th'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('HAIZHAO LI'),
            subtitle: Text('li_haizhao@cmu.ac.th'),
          ),
        ],
      ),
    );
  }
}