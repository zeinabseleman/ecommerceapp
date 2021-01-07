import 'package:ecommerceapp/view/auth/widgets/customtext.dart';
import 'package:flutter/material.dart';

class CustomFlatButtonSocial extends StatelessWidget {
  final String imageName;
  final String text;
  final Function onPressed;

  const CustomFlatButtonSocial({Key key, this.imageName, this.text, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade50
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: onPressed,
          child: Row(
            children: [
              Image.asset(imageName,width: 50,height: 50,),
              SizedBox(width: 70,),
              CustomText(text: text,)
            ],
          )
      ),
    );
  }
}
