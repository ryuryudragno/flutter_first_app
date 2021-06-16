import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/util/hexcolor.dart';


class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  
  Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.2), //Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total per Person"),

                    Text("\$123"),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                      prefixText: "Bill Account",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value){
                      try{
                        _billAmount = double.parse(value);

                      }catch(exception){
                        _billAmount = 0.0;
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {

  int _index = 0;
  List quotes = [
    "majiman",
    "soretteanananokannsoudesuyone???",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(child: Text(quotes[_index % quotes.length],
                    style: TextStyle(
                      color: Colors.black38,
                      fontStyle: FontStyle.italic,

                    ),))),
              ),
            ),

            Divider(thickness:1.3),

            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: FlatButton.icon(
                  onPressed: _showQuote,
                  color: Colors.greenAccent.shade100,
                  icon: Icon(Icons.wb_sunny),
                  label: Text("Imspire!!",
                    style:TextStyle(
                      fontSize: 18.0,
                      color:Colors.black
                    ),
              )),
            ),
            Spacer(

            )
          ],
        ),
      ),
    );
  }

  _showQuote() {
    //increment our index counter1
    setState(() {
      _index += 1;
      // if(_index >= 2){
      //   _index =0;
      // }
    });

  }
}


class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard",),

      ),
      body:Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            _getCard(),
            _getAvatar(),
          ],
        ),
      )
    );
  }

  Container _getCard() {
    return Container(
      width:350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(50)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Ryuryudragno",style: TextStyle(fontSize: 20.9,
          fontWeight: FontWeight.w500,
          color: Colors.white)),
          Text("Yeah"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_outline),
              Text("T:@buildappwithme")
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(40)),
        border: Border.all(color: Colors.redAccent,width: 10),
        image: DecorationImage(image:NetworkImage("https://picsum.photos/id/1/300/300"),
        fit: BoxFit.cover)

      ),
    );
  }
}

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
