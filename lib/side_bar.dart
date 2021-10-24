import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation/about_us.dart';
import 'package:meditation/main.dart';
import 'package:meditation/progress.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
                child: Text(
              "Let's Meditate!",
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "Times new Roman",
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
            decoration: BoxDecoration(color: Colors.greenAccent),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage())),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Progress'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => AddProgress())),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => AboutUsInfo())),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Quit'),
            onTap: () => {SystemNavigator.pop()},
          ),
        ],
      ),
    );
  }
}
