import 'package:flutter/material.dart';
import 'package:khatem_tasbih/Categories/app_colors.dart';
import 'package:khatem_tasbih/Categories/app_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          SizedBox(height: 35),
          Image.asset(AppImages.tasbeeh),
          SizedBox(height: 150),
          Container(
            padding: EdgeInsets.all(20),
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100), bottomRight: Radius.circular(100), topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              boxShadow: [BoxShadow(color: AppColors.black, blurRadius: 4, offset: Offset(-3, 3))]
              
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.black, width: 5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Text(counter.toString(), style: TextStyle(fontSize: 20))),
                      SizedBox(width: 100,
                        child: DropdownButton
                          (
                            underline: Container(),
                            iconSize: 30,
                            value: selectedValue,

                            hint: Text("اذكر الله", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),),
                            items:
                            [
                              DropdownMenuItem(value: 'سبحان الله', child: Text("سبحان الله", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                              DropdownMenuItem(value: 'الحمد لله', child: Text("الحمد لله", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                              DropdownMenuItem(value: 'لا إله إلا الله', child: Text("لا إله إلا الله", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                              DropdownMenuItem(value: 'الله أكبر', child: Text("الله أكبر", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                              DropdownMenuItem(value: 'صلى على النبى', child: Text("صلى على النبى", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold))),
                            ],
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue; // Update the selected value
                              });
                            },
                            icon: Icon(Icons.arrow_drop_down),
                                              ),
                      ),
                      SizedBox(width: 20),

                    ],
                  ),
                ),
                SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 25),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white70, width: 2),
                            boxShadow: [BoxShadow(color: AppColors.black, spreadRadius: 3, blurRadius: 3, offset: Offset(0, 1))]
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            counter++;
                          });
                        },
                      ),
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white70, width: 2),
                                boxShadow: [BoxShadow(color: AppColors.black, spreadRadius: 3, blurRadius: 3, offset: Offset(0, 1))]
                            ),
                          ),
                          onTap: ()
                          {
                            setState(() {
                              counter = 0;
                            });
                          },
                        ),
                        SizedBox(height: 5),
                        Text("Reset", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
