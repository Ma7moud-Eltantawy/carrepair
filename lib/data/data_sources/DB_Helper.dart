import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mechanic/core/models/user_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DB_Helper{

  // shprefs init
  static shprefsinit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try{
      prefs.get('show');
    }
    catch(e)
    {
      prefs.setBool('show',false);
    }

  }
  static Future<bool?> isBoardingSeen()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.get('show').toString());
    print("step2");
    return prefs.getBool('show');
  }

  static prefs_boardingscreen()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('show',true);
  }

  static Saveuser(User user)async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('user_data', [user.email.toString(),user.email!.split('@').first,user.uid.toString()]);


  }
  static Future<UserModel> getuserfromdb()async
  {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> userdata= prefs.getStringList('user_data')!.toList();
    print(userdata);
    final usermodel=UserModel(name:userdata[1] , email: userdata[0], token: userdata[2]);;
    return usermodel;


  }
  static Deluserfromdb() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

  }
  static Future<String?> getUserToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> userdata= prefs.getStringList('user_data')!.toList();
    if (userdata[2].isEmpty) {
      return null;
    } else {
      return userdata[2];
    }
  }


}