import 'package:app/widget/LoginView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget{
  void logout(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginView())
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                logout(context);
              },
              child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "LOGOUT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                        Icon(
                          Icons.power_settings_new,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )

              ),
            )

          ],
        ),
      ),
    );
  }

}