import 'package:ecommerceapp/view/auth/widgets/customflatbutton.dart';
import 'package:ecommerceapp/view/auth/widgets/customtext.dart';
import 'package:ecommerceapp/view/auth/widgets/customtextfield.dart';
import 'package:ecommerceapp/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class RegisterScreen extends GetWidget<AuthModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined), onPressed: null),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomText(text:'Sign Up' ,color: Colors.black,fontSize: 30),
                SizedBox(height: 50,),
                CustomTextField( text: 'Name',hint: 'enter name ',
                  onSaved: (value){
                    controller.name = value;
                  },
                  validator: (value){
                    if(value == null){
                      print('error');
                    }
                  },
                ),
                SizedBox(height: 40,),
                CustomTextField( text: 'Email',hint: 'name@gmail.com',
                  onSaved: (value){
                    controller.email = value;
                  },
                  validator: (value){
                    if(value == null){
                      print('error');
                    }
                  },
                ),
                SizedBox(height: 40,),
                CustomTextField( text: 'Password',hint: '*******',
                    onSaved: (value){
                      controller.password = value;
                    },
                    validator: (value){
                      if(value == null){
                        print('error');
                      }
                    }),
                SizedBox(height: 30,),
                CustomFlatButton(text: 'SIGN UP',
                  onPressed: (){
                    _formKey.currentState.save();
                    if(_formKey.currentState.validate()){
                      controller.signupWithEmailandPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
