import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/features/Updates/views/settings_view.dart';
import '../../../core/app_assets/AppColors.dart';
import '../../../core/app_assets/AppIcons.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                InkWell(
                  child: SvgPicture.asset(AppIcons.curvearrowbackward),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SettingsView();
                    }));
                  },
                ),
                SizedBox(width: 120),
                Text("Settings", style: TextStyle(fontSize: 19)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                      child: Text("Language", style: TextStyle(fontSize: 20))),
                  Container(
                    width: 51,
                    height: 36,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5)),
                        color: AppColors.lightGrey),
                    child: Center(
                        child: Text(
                      'AR',
                      style: TextStyle(fontSize: 16),
                    )),
                  ),
                  Container(
                    width: 51,
                    height: 36,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        color: AppColors.green),
                    child: Center(
                        child: Text(
                      'EN',
                      style: TextStyle(fontSize: 16, color: AppColors.white),
                    )),
                  )
                ],
              )),
          Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                      child:
                          Text("Notification", style: TextStyle(fontSize: 20))),
                  Switch(
                      activeTrackColor: AppColors.green,
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      })
                ],
              )),
          Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                      child:
                          Text("Enable Cloud", style: TextStyle(fontSize: 20))),
                  Transform.scale(
                      scale: 2,
                      child: Checkbox(
                          side: BorderSide(color: AppColors.semiPurple),
                          activeColor: AppColors.green,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          }))
                ],
              ))
        ],
      ),
    );
  }
}
