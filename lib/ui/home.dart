import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {

  _tapButton(){
    debugPrint("Tapped button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade200,
        actions: [
          IconButton(onPressed: ()=> debugPrint("aa"), icon: Icon(Icons.email)),
          IconButton(onPressed: _tapButton, icon: Icon(Icons.access_alarm))
        ],
      ),
      body: Center(
        child: Text("Hello Again"),
      ),
    );
  }
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amberAccent,
      child: Center(
          child: Text(
            "Hello Flutter",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 23.4,
                fontStyle: FontStyle.italic
            ),
          )),
    );
    // return Center(
    //   child: Text("Hello Flutter",
    //     textDirection: TextDirection.ltr,),//Text
    // );
  }
}
