//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_app/routes.dart';
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Demo',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Firebase '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
      TextEditingController nameController;
      TextEditingController addressController;
      TextEditingController eduController;

      @override
      void initState() {
        nameController = TextEditingController();
        addressController = TextEditingController();
        eduController = TextEditingController();
        super.initState();
      }

      @override
      void dispose() {
        nameController.dispose();
        addressController.dispose();
        eduController.dispose();
        super.dispose();
      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("ABOUT YOURSELF !! ",

          style: TextStyle(color: Colors.black),
        ),
      ),

      body:
      Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    labelText: 'Your name',
                  ),
                )
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Address",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                TextField(
                  //style: bac,
                  controller: addressController,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    labelText: 'Address',
                  ),
                  maxLines: 3,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Education",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),                SizedBox(
                  height: 3,
                ),
                TextField(
                  //style: bac,
                  controller: eduController,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    labelText: 'Education',
                  ),
                  maxLines: 3,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),


            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(padding: EdgeInsets.all(5)),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor:
                        const Color.fromRGBO(247, 64, 106, 1.0),
                        primary: Colors.white),
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.3,
                        color: Colors.white,

                        //borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                      ),
                    ),
                    onPressed: () {
                      Firestore.instance.collection('users').doc().set({
                          'Name': nameController.text,
                          'Address': addressController.text,
                          'Education': eduController.text,
                        });
                      Navigator.of(context).push(SlideRightRoute(page: Details()));
                    })
              ],
            ),
          ],
        ),
      ),

    );
  }}
