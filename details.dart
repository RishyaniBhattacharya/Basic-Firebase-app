import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Details extends StatefulWidget {
  @override
  DetailsState createState() => new DetailsState();
}

class DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(
            Icons.chevron_left_sharp,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,
        elevation: 5,
        centerTitle: true,
        title: Text("WELCOME !! ",

          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data.docs.map((document) {
              return Container(
                
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                  children: [
                    Text(document['Name']
                    ),
                    Text(document['Address']
                    ),
                    Text(document['Education']
                    ),
              ],
              ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
