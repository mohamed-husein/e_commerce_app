import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibility = false;

  var displayMyName = '';
  var displayImage = '';

  var auth = FirebaseAuth.instance;

  void changeVisibility() {
    isVisibility = !isVisibility;
    update();
  }

  bool isCheck = false;

  void changeCheck() {
    isCheck = !isCheck;
    update();
  }

  void signUpWithFireBase({
    required String name,
    required String email,
    required String phone,
    required String pass,
  }) async {
    auth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      createUser(
          name: name, email: email, phone: phone, uId: auth.currentUser!.uid);
      Get.offNamed(Routes.mainScreen);
    }).catchError((error) {
      print(error.toString());
    });
  }

  void createUser({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    UserModel userModel = UserModel(
        image:
            'https://t4.ftcdn.net/jpg/02/15/84/43/240_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg',
        uId: uId,
        email: email,
        name: name,
        phone: phone);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      update();
    }).catchError((error) {
      print(error.toString());
    });
  }

  void loginWithFireBase({
    required String email,
    required String pass,
  }) async {
    await auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      update();
      Get.offNamed(Routes.mainScreen);
    }).catchError((error) {});
  }

  void resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email).then((value) {
      update();
    }).catchError((error) {});
  }

  void googleSignUp() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      displayImage = googleUser!.photoUrl!;
      displayMyName = googleUser.displayName!;
      update();
      print(googleUser.displayName!);
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          backgroundColor: Colors.grey,
          colorText: Colors.black,
          duration: const Duration(milliseconds: 300),
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

}
