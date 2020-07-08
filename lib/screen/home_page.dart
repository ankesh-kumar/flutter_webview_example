
import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_webview_example/utility/common_fun.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'error_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  num position = 1 ;
  final key = UniqueKey();
  String currentUrl="";
  WebViewController webView;

  void refresh(){
    setState(() {

      position = 1;
    });
  }

  doneLoading(String A) {
    setState(() {

      currentUrl=A;
      position = 0;
    });
  }

  startLoading(String A){
    setState(() {
      currentUrl=A;
      position = 1;
    });
  }

   goToError(WebResourceError error)
  {

    Navigator.pushReplacement(context,new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return ErrorPage(title: widget.title,error: error,url: currentUrl,);
      },
      fullscreenDialog: true,


    ));


  }


    Future<bool> goBack() async {
      bool goBack;

      var value = await webView.canGoBack();  // check webview can go back

      if (value) {

        webView.goBack(); // perform webview back operation

        return false;

      } else {

        await showDialog(

          context: context,

          builder: (context) => new AlertDialog(

            title: new Text('Alert', style: TextStyle(color: Colors.purple)),

            // Are you sure?

            content: new Text('Do you want to exit app ? '),

            // Do you want to go back?

            actions: <Widget>[

              new FlatButton(

                onPressed: () {

                  Navigator.of(context).pop(false);

                  setState(() {

                    goBack = false;

                  });

                },

                child: new Text('No'), // No

              ),

              new FlatButton(

                onPressed: () {

                  Navigator.of(context).pop();

                  setState(() {

                    goBack = true;

                  });

                },

                child: new Text('Yes'), // Yes

              ),

            ],

          ),

        );

        return goBack;

      }

    }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: goBack,
      child: Scaffold(
          appBar: AppBar(
              title: Text(widget.title)),
          body: IndexedStack(
              index: position,
              children: <Widget>[

                WebView(
                  initialUrl: CommonFun.init_url,
                  javascriptMode: JavascriptMode.unrestricted,
                  key: key ,
                  onPageFinished: doneLoading,
                  onPageStarted: startLoading,
                  onWebResourceError: goToError,
                  onWebViewCreated: (WebViewController controller){
                    webView=controller;
                  },

                ),

                Container(
                  color: Colors.white,
                  child: Center(
                      child: CircularProgressIndicator()),
                ),




              ])
      ),
    );
  }



}
