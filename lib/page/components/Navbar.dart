import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testproject2/page/listOfRequest.dart';
import 'package:testproject2/page/listOfSpot.dart';
import 'package:testproject2/page/login.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            accountName: Text("Hello User!"),
            accountEmail: Text(user.email!),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.network(
                'https://png.pngitem.com/pimgs/s/146-1468281_profile-icon-png-transparent-profile-picture-icon-png.png',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              )),
            ),
          ),
          ListTile(
            leading: Icon(Icons.featured_play_list),
            title: Text('List of cautious spot'),
            onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyList())),
          ),
          if(user.email =="hin@hotmail.com") ListTile(
            leading: Icon(Icons.doorbell),
            title: Text('Request'),
            onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyRequest())),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
            } 
          )
        ],
      ),
    );
  }
}
