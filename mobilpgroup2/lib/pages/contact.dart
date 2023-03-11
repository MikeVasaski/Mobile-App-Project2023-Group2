import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact page"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none, //add notification icon in appbar
              )),
        ],
        backgroundColor: Color.fromARGB(255, 33, 97, 35),
      ),
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
