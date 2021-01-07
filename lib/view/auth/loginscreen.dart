import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/view/auth/registerscreen.dart';
import 'package:ecommerceapp/view/auth/widgets/customflatbutton.dart';
import 'package:ecommerceapp/view/auth/widgets/customflatbuttonsocial.dart';
import 'package:ecommerceapp/view/auth/widgets/customtext.dart';
import 'package:ecommerceapp/view/auth/widgets/customtextfield.dart';
import 'package:ecommerceapp/view_model/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'Welcome,',fontSize: 30,),
                    GestureDetector(
                      onTap: (){
                        Get.to(RegisterScreen());
                      },
                        child: CustomText(text:'Sign Up' ,color: primaryColor,fontSize: 18,))
                  ],
                ),
                SizedBox(height: 10,),
                CustomText(text:'Sign in to continue' ,color: Colors.grey,fontSize: 14,),
                SizedBox(height: 50,),
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
                SizedBox(height: 20,),
                CustomText(text: 'Forget Password?',fontSize: 14,alignment: Alignment.topRight,),
                SizedBox(height: 30,),
                CustomFlatButton(text: 'SIGN IN',
                  onPressed: (){
                  _formKey.currentState.save();
                  if(_formKey.currentState.validate()){
                    controller.signinWithEmailandPassword();
                  }
                  },
                ),
                SizedBox(height: 20,),
                CustomText(text: '-OR-',alignment: Alignment.center,),
                SizedBox(height: 40,),
                //CustomFlatButtonSocial(text: 'Sign In With Facebook',imageName: 'images/facebook.png',onPressed: (){},),
               // SizedBox(height: 20,),
                CustomFlatButtonSocial(text: 'Sign In With Google',imageName: 'images/googleimage.png',
                  onPressed: (){
                  controller.signinwithGoogle();
                  }
                    ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
