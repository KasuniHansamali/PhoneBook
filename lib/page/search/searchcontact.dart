import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/employee.dart';
import 'package:todo/page/editpage.dart';
import 'package:todo/services/firebase_crud.dart';

class SearchContactScreen extends StatefulWidget {
  @override
  _SearchContactScreenState createState() => _SearchContactScreenState();
}

class _SearchContactScreenState extends State<SearchContactScreen> {
  final TextEditingController _searchController = TextEditingController();
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readEmployee();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search by Contact Number",
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            List<DocumentSnapshot> filteredDocs = snapshot.data!.docs.where((doc) =>
                doc.get("contact_no").toLowerCase().contains(_searchText)
            ).toList();


            return
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15, top: 6,),
                child: ListView.builder(
                  itemCount: filteredDocs.length,
                  itemBuilder: (context, index) {
                    return

                      Padding(
                        padding: const EdgeInsets.only( top: 3,bottom: 3),


                        child: Container(
                          decoration: BoxDecoration(color: Colors.grey),

                          child: ListTile(
                            title: Text(filteredDocs[index].get("employee_name")),
                            subtitle: Container(
                              child: (Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(filteredDocs[index].get("position")),
                                  Text(filteredDocs[index].get("contact_no")),
                                  Text(filteredDocs[index].get("email")),

                                ],
                              )),
                            ),
                            // Other widget properties here
                          ),
                        ),
                      );

                  },
                ),
              );


          }
        },
      ),
    );
  }
}
