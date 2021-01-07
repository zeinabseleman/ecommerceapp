import 'package:ecommerceapp/view/auth/widgets/customtext.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomFlatButton({Key key, this.text, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        padding: EdgeInsets.all(18),
        color: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
        child: CustomText(text: text,color: Colors.white,alignment: Alignment.center,)
    );
  }
}
