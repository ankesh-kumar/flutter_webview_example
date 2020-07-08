import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_example/utility/common_fun.dart';

import 'home_page.dart';


class SplashPage extends StatefulWidget{

  SplashPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

   var timeout = const Duration(seconds: 3);
   var ms = const Duration(milliseconds: 1);

  startTimeout([int milliseconds]) {


    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }

   void handleTimeout() async{

     Navigator.pushReplacement(context,new MaterialPageRoute<Null>(
       builder: (BuildContext context) {
         return MyHomePage(title: widget.title);
       },
       fullscreenDialog: true,


     ));

   }

     @override
  void initState() {
       startTimeout(CommonFun.spalash_timeout);
  }

  @override
  Widget build(BuildContext context) {
    return buildSplash(context);
  }


  Widget buildSplash(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title)),
      body: Center(
        child: Icon(
                Icons.open_in_browser,
                size:100,
                color: Colors.blue,
            ),),
    );
  }





}


