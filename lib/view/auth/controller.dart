
import 'package:ecommerceapp/view/auth/loginscreen.dart';
import 'package:ecommerceapp/view_model/auth_view_model.dart';
import 'package:ecommerceapp/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthModel> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return (Get.find<AuthModel>().user == null)
          ? LoginScreen()
          : GetBuilder<HomeViewModel>(
           // init: HomeViewModel() ,
          builder: (controller) =>
             Scaffold(
              bottomNavigationBar: _bottomNavigationBar(),
              body: controller.currentScreen
      ),
          );

    });
  }

  Widget _bottomNavigationBar(){
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) =>
          BottomNavigationBar(
              currentIndex: controller.selectedvalue,
              selectedItemColor: Colors.black,
              elevation: 0,
              backgroundColor: Colors.grey.shade50,
              onTap: (index){
                controller.changeSelectedValue(index);

              },
              items: [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset('images/explore.png',fit: BoxFit.contain,width: 20,),
                    ),
                    label: '',
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text('Explore'),
                    )
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset('images/cart_shop_buy_retail-256.png',fit: BoxFit.contain,width: 20,),
                    ),
                    label: '',
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text('Cart'),
                    )
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset('images/account.png',fit: BoxFit.contain,width: 20,),
                    ),
                    label: '',
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text('Account'),
                    )
                ),

              ]),
    );
  }
}
