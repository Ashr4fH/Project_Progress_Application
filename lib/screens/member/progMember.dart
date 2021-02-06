import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_progress_app/models/circle.dart';
import 'package:project_progress_app/services/auth.dart';

class ProMembers extends StatefulWidget {
  @override
  _ProMembersState createState() => _ProMembersState();
}

class _ProMembersState extends State<ProMembers> {
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Progress'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser.uid)
                .collection('Members')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/d.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomPaint(
                        foregroundPainter: CircleProgress(
                            progress), // this will add custom painter after child
                        child: Container(
                            width: 150,
                            height: 150,
                            child: Center(
                                child: Text(
                              "$progress %",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ))),
                      ),
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        value: progress,
                        onChanged: (val) {
                          setState(() {
                            progress = val;
                          });
                        },
                        divisions: 10,
                      ),
                      RaisedButton(
                        color: Colors.green[400],
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          updateProgress(progress);
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
