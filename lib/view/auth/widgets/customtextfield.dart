import 'package:ecommerceapp/view/auth/widgets/customtext.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String hint;
  final Function onSaved;
  final Function validator;

  const CustomTextField({Key key, this.text, this.hint, this.onSaved, this.validator}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
       child:  Column(
         children: [
           CustomText(text: text,color: Colors.grey.shade900,),
           TextFormField(
             onSaved: onSaved ,
             validator:validator ,
             decoration: InputDecoration(
                 hintText: hint,
                 fillColor: Colors.white,
                 hintStyle: TextStyle(color: Colors.black54,fontSize: 14)
             ),
           )
         ],
       ),
    );
  }
}
