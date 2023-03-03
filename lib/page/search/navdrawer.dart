import 'package:flutter/material.dart';
import 'package:todo/page/search/searchcontact.dart';
import 'package:todo/page/search/searchdepartment.dart';
import 'package:todo/page/searchpage.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only( left: 4, top: 10,bottom: 3),
            child: ListTile(
              leading: Icon(Icons.search),
              title: Text('Search By Followings', style: const TextStyle(fontSize: 18)),

            ),
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text('Employee Name'),
            onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen()))

            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contact No'),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchContactScreen ()))
            },


          ),
          ListTile(
            leading: Icon(Icons.border_clear),
            title: Text('Department'),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchDepartmentScreen ()))
            },
          ),

        ],
      ),
    );
  }
}