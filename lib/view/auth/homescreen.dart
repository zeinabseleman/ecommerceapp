
import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/view/auth/widgets/customtext.dart';
import 'package:ecommerceapp/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
final List<String> category = ['men' , 'women' , 'd' , 'd' , 'd'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100,right: 20,left: 20),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _sarchtextfield(),
                SizedBox(height: 30,),
                CustomText(text: 'Categories',fontSize: 20,),
                SizedBox(height: 30,),
                _listviewCategories(),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     CustomText(text: 'Best Selling',fontSize: 25),
                     CustomText(text: 'See all',fontSize: 25),
                   ],
                ),
                SizedBox(height: 20,),
                _listviewProduct()
              ],
            ),
          ),
        ),

      ),

       
    );
  }

  Widget _listviewCategories(){
   return Container(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context , index){
            return Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    width:80,
                    height:80,
                    child: Image.asset('images/shoes.png')
                ),
                CustomText(text: category[index],)
              ],
            );
          }, separatorBuilder: (context,  index) => SizedBox(width: 20,),
        )
    );
  }
  Widget _sarchtextfield(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search,color: Colors.black,)
        ),
      ),
    );
  }
  Widget _listviewProduct(){
    return Container(
        height: 300,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context , index){
            return Container(
              width: MediaQuery.of(context).size.width*0.4,
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Container(
                        width:MediaQuery.of(context).size.width*0.4,
                          child: Image.asset('images/watch.png',fit: BoxFit.cover),
                        height: 220,
                      )
                  ),
                  SizedBox(height: 5),
                  CustomText(text: 'Apple Watch',),
                  SizedBox(height: 5,),
                  CustomText(text: '\$775',alignment: Alignment.bottomLeft,color: primaryColor,),
                ],
              ),
            );
          }, separatorBuilder: (context,  index) => SizedBox(width: 20,),
        )
    );
  }

}
