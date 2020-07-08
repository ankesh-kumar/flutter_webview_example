
import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';

import 'home_page.dart';


class ErrorPage extends StatefulWidget{

  ErrorPage({Key key, this.title,this.error,this.url}) : super(key: key);
  final String title;
  final WebResourceError error;
  final String url;

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {

  String text="Something went wrong !!!";




  @override
  Widget build(BuildContext context) {
    return buildError(context);
  }


  Widget buildError(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
        title: Text(widget.title)),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,),
          SizedBox(height: 10,),
          IconButton(icon: Icon(Icons.refresh),onPressed: refresh,)

        ],
      ),

    ),
  );
  }


  void refresh(){
    Navigator.pushReplacement(context,new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
      return MyHomePage(title: widget.title);}));

  }

}


