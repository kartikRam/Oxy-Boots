import 'package:flutter/material.dart';
import 'package:flutterprojects/Styles/font_styles.dart';
import 'package:flutterprojects/colors/Colors.dart';
import 'package:flutterprojects/customwidget/CustomFilterButton.dart';
import 'package:flutterprojects/statictext/StaticText.dart';

class BottomScreenSheet {
  static String selectedGender = 'All';
  static double selectedSize = 8.0;
  static RangeValues selectedPriceRange = const RangeValues(50, 200);
  static String generatedId = '';
  static final List<String> genders = ['All', 'Male', 'Female', 'Unisex'];

  static void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                        Expanded(child: Container(alignment:Alignment.center,
                            child: Text(StaticText.filter,style: textStyle24px,))),
              
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("RESET",style: textStyle1,),
                       ),
                     ],
                   ),
                    const SizedBox(height: 10,),
                    Text("Gender",style: textStyle18px,),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width:97,height: 48,child:
                        CustomFilterButton(btnText: genders[0], callback: (){},
                          padding: buttonPadding,textStyle:textStyle16White,
                          bgColor: ShoesColors.loginButtonColor,)),
                        SizedBox(width:97,height: 48,child:
                        CustomFilterButton(btnText: genders[1], callback: (){},
                          padding: buttonPadding,textStyle:textStyle16Black, bgColor: ShoesColors.unSelectedBgColor,)),
                        SizedBox(width:97,height: 48,child:
                        CustomFilterButton(btnText: genders[2], callback: (){},
                          padding: buttonPadding,textStyle:textStyle16Black, bgColor: ShoesColors.unSelectedBgColor,)),
                      ],
                    ),
                    Text('Size',style: textStyle18px,),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right:8),
                            child: SizedBox(width:97,child:
                            CustomFilterButton(btnText: "UK 4.4", callback: (){},
                              padding: buttonPadding,textStyle:textStyle16Black, bgColor: ShoesColors.unSelectedBgColor, )),
                          ),
                          Padding(
                            padding:  const EdgeInsets.only(right:8),
                            child: SizedBox(width:97,child:
                            CustomFilterButton(btnText: "US 5.5", callback: (){},
                              padding: buttonPadding,textStyle:textStyle16White,bgColor: ShoesColors.loginButtonColor,)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:8),
                            child: SizedBox(width:97,child:
                            CustomFilterButton(btnText: "Uk 6.5", callback: (){},
                              padding: buttonPadding,textStyle:textStyle16Black, bgColor: ShoesColors.unSelectedBgColor,)),
                          ),
                          Padding(
                            padding:  const EdgeInsets.only(right:8),
                            child: SizedBox(width:97,child:
                            CustomFilterButton(btnText: "EU 11.5", callback: (){},
                              padding: buttonPadding,textStyle:textStyle16Black, bgColor: ShoesColors.unSelectedBgColor,)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text('Price',style: textStyle18px),
                    RangeSlider(
                      activeColor: ShoesColors.loginButtonColor,
                      values: selectedPriceRange,
                      min: 0,
                      max: 500,
                      divisions: 100,
                      onChanged: (newRange) {
                        setState(() {
                          selectedPriceRange = newRange;
                        });
                      },
                    ),
                    const SizedBox(height: 15,),
                    CustomFilterButton(btnText: "Apply",
                        callback: (){Navigator.pop(context);},
                        textStyle: textStyle18White, padding: applyButtonPadding,bgColor: ShoesColors.loginButtonColor,),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  static String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
