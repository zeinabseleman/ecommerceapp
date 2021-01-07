


import 'package:ecommerceapp/model/user_model.dart';
import 'package:ecommerceapp/view/auth/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'addtofirestore.dart';

class AuthModel extends GetxController{
FirebaseAuth _auth = FirebaseAuth.instance;
GoogleSignIn _googleSignIn = GoogleSignIn();
FacebookLogin _facebookLogin = FacebookLogin();
String email , password , name ;

//user value changes
 Rx<User> _user = Rx<User>();

 //if user logged in or not
 String get user=> _user.value?.email ;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void signinwithGoogle() async{
     final GoogleSignInAccount googleUser =await _googleSignIn.signIn();
     GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
       accessToken: googleSignInAuthentication.accessToken,
       idToken: googleSignInAuthentication.idToken
     );
      await _auth.signInWithCredential(credential);
      //     .then((user) {
      //   saveUser(user);
      // });

  }

  // void signinwithFacebook()async{
  //    FacebookLoginResult result = await _facebookLogin.logIn(['email']);
  //    final accessToken = result.accessToken.token;
  //    if(result.status == FacebookLoginStatus.loggedIn){
  //      final facebookCredintial = FacebookAuthProvider.credential(accessToken);
  //      await _auth.signInWithCredential(facebookCredintial);
  //    }
  // }

  void signinWithEmailandPassword() async{
    try{
     await _auth.signInWithEmailAndPassword(email: email, password: password);
     Get.offAll(HomeScreen());
    } catch(e){
      Get.snackbar('Error Login', e.message ,colorText: Colors.black , snackPosition: SnackPosition.BOTTOM );
    }

  }
  void signupWithEmailandPassword() async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      //     .then((user) async{
      //      saveUser(user);
      // });
      Get.offAll(HomeScreen());
    } catch(e){
      Get.snackbar('Error Login', e.message ,colorText: Colors.black , snackPosition: SnackPosition.BOTTOM );
    }

  }

  void saveUser(UserCredential user) async{
    await FirestoreUser().adduserToFirestore(UserModel(
      userId: user.user.uid,
      email: user.user.email,
      pic: '',
      name: name == null ? user.user.displayName : name,
    ));
  }
}