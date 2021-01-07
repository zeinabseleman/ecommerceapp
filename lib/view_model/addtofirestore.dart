

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/user_model.dart';

class FirestoreUser {
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('Users');

  Future<void> adduserToFirestore(UserModel userModel) async{
    return await _collectionReference.doc(userModel.userId)
        .set(userModel.toJson());
  }
}