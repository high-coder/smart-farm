import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:node_connect/ourUser.dart';

class CurrentState extends GetxController {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> loginUser(String email, String password) async {
    String retVal = "error";
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        retVal = "success";

        // currentUser.email = result.user?.email;
        // currentUser.uid = result.user?.displayName;
      }
    } on FirebaseAuthException catch (e) {
      retVal = e.message ?? "something went wrong";
      print(e.toString());
    }
    return retVal;
  }

  /// this is the function to create a new user in the application
  Future<String> createNewUser(
      {required String name,
      required String email,
      required String password}) async {
    String retVal = "error";
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        User? user = result.user;

        OurUser random =
            OurUser(name: "Gurpal Singh", email: user?.email, uid: user?.uid);
        createUser(random);
        if (retVal == "success") {
          //userBox.put("data", currentUser);
        }
      }

      // await DatabaseManager().getUsersList(user.uid);
    } on FirebaseAuthException catch (e) {
      retVal = e.message ?? "something went wrong";
    }

    return retVal;
  }

  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    try {
      await _firestore.collection('users').doc(user.uid).set(user.toJson());
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
