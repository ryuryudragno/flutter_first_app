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
        actions: <Widget>[
          IconButton(onPressed: ()=> debugPrint("aa"), icon: Icon(Icons.email)),
          IconButton(onPressed: _tapButton, icon: Icon(Icons.access_alarm))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.call_missed),
        onPressed: ()=> debugPrint("Hello"),

      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.account_circle),title: Text("First")),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),title: Text("Second")),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm_outlined),title: Text("Third")),

      ],onTap: (int index) => debugPrint("Tapped Item : $index"),),
      backgroundColor: Colors.redAccent.shade100,
      body: Container(
        alignment: Alignment.center,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton()

            // InkWell(
            //   child: Text("Tap me",
            //   style: TextStyle(fontSize: 23.4),),
            //   onTap: ()=> debugPrint("aaa"),
            // )
          ],
        )
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final snackBar = SnackBar(content: Text("Hello Again"),
        backgroundColor: Colors.cyanAccent.shade100,);

        Scaffold.of(context).showSnackBar(snackBar);
      },

      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(8.0),

        ),
        child: Text("Button"),
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
