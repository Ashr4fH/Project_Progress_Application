import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> removeProject(String name) async {
  String uid = FirebaseAuth.instance.currentUser.uid;
  FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Project')
      .doc(name)
      .delete();
  return true;
}

Future<void> addProject(String name, String location, geolocation) async {
  String uid = FirebaseAuth.instance.currentUser.uid;
  CollectionReference project = FirebaseFirestore.instance
      .collection("Users")
      .doc(uid)
      .collection("Project");

  project.add(
      {'projectName': name, 'location': location, 'geolocation': geolocation});

  return;
}

Future<void> addMembers(String name, String position) async {
  String uid = FirebaseAuth.instance.currentUser.uid;

  CollectionReference project = FirebaseFirestore.instance
      .collection("Users")
      .doc(uid)
      .collection("Members");

  project.add({
    'membersName': name,
    'membersPosition': position,
    'progress': 0.0,
  });
  return;
}

Future<void> updateProgress(double progress) async {
  String uid = FirebaseAuth.instance.currentUser.uid;

  DocumentReference project = FirebaseFirestore.instance
      .collection("Users")
      .doc(uid)
      .collection("Members")
      .doc();

  project.update({
    'progress': progress,
  });
  return;
}
