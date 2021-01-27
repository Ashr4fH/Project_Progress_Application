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

Future<void> addPro(String name, String location) async {
  String uid = FirebaseAuth.instance.currentUser.uid;
  DocumentReference documentReference = FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Project')
      .doc(name);

  documentReference.set({'projectName': name, 'location': location});
}

Future<bool> addCoin(String id, String amount) async {
  try {
    String uid = FirebaseAuth.instance.currentUser.uid;
    var value = double.parse(amount);
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Coins')
        .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Amount': value});
        return true;
      }
      double newAmount = snapshot.data()['Amount'] + value;
      transaction.update(documentReference, {'Amount': newAmount});
      return true;
    });
    return true;
  } catch (e) {
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

Future<void> addProject(String name, String location) async {
  String uid = FirebaseAuth.instance.currentUser.uid;
  DocumentReference project = FirebaseFirestore.instance
      .collection("Users")
      .doc(uid)
      .collection("Project")
      .doc(name);

  project.set({'projectName': name, 'location': location});
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

Future<void> addImage(String url) async {
  String uid = FirebaseAuth.instance.currentUser.uid;

  DocumentReference project = FirebaseFirestore.instance
      .collection("Users")
      .doc(uid)
      .collection("Image")
      .doc(url);

  project.set({'url': url});
  return;
}
