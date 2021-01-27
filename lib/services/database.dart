import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  final String uid;
  Database({this.uid});
  CollectionReference project = FirebaseFirestore.instance.collection("Users");

  Future<void> addProject(String name, String location) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    project.doc(uid).collection("Project").doc(name);

    project.add({'projectName': name, 'location': location});
    return;
  }

  Future<void> addMembers(String name, String position) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    DocumentReference project = FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Members")
        .doc(name);

    project.set({
      'membersName': name,
      'membersPosition': position,
    });
    return;
  }
}
