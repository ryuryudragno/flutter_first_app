import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/model/question.dart';
import 'package:flutter_first_app/util/hexcolor.dart';


class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;


  List questionBank = [
    Question.name(
        "The U.S. Declaration of Independence was adopted in 1776", true),
    Question.name("The Supreme law of the land is the Constitution.", true),
    Question.name(
        "The two rights in the Declaration of Independence are:"
            "\n Life"
            "\n Pursuit of happiness.",
        true),
    Question.name("The (U.S.) Constitution has 26 Amendments.", false),
    Question.name(
        "Freedom of religion means:"
            "\n You can practice any religion, "
            "or not practice a religion.",
        true),
    Question.name("Journalist is one branch or part of the government.", false),
    Question.name("Journalist is one branch or part of the government.", false),
    Question.name("The Congress does not make federal laws.", false),
    Question.name("There are 100 U.S. Senators.", true),
    Question.name("We elect a U.S. Senator for 4 years.", false), //6
    Question.name("We elect a U.S. Representative for 2 years", true),
    Question.name(
        "A U.S. Senator represents all people of the United States", false),
    Question.name("We vote for President in January.", false),
    Question.name("Who votes bills is the President.", true),
    Question.name("The Constitution was written in 1787.", true),
    Question.name('George Bush is the \ " Father of Our Country " \.', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.grey,

      //We use [Builder] here to use a [context] that is a descendent of [Scaffold]
      // or else [Scaffold.of] will return null
      body: Builder(

        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("images/flag.png",
                  width: 250,
                height: 180,),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border:Border.all(
                      color: Colors.blueGrey.shade400,style: BorderStyle.solid
                    )
                  ),
                  height: 120,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[_currentQuestionIndex ].questionText,style: TextStyle(
                      fontSize: 16.9,
                      color: Colors.white,
                    ),),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(onPressed: () => _prevQuestion(),
                      color: Colors.blueGrey.shade900,
                      child:Icon(Icons.arrow_back,color:Colors.white,)
                  ),
                  RaisedButton(onPressed: () => _checkAnswer(true,context),
                  color: Colors.blueGrey.shade900,
                  child:Text("True",style: TextStyle(color: Colors.white),)
                  ),
                  RaisedButton(onPressed: () => _checkAnswer(false,context),
                      color: Colors.blueGrey.shade900,
                      child:Text("False",style: TextStyle(color: Colors.white),)
                  ),
                  RaisedButton(onPressed: () => _nextQuestion(),
                      color: Colors.blueGrey.shade900,
                      child:Icon(Icons.arrow_forward,color:Colors.white,)
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice,BuildContext context) {
    if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
      final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Correct!"));
      Scaffold.of(context).showSnackBar(snackbar);

      _updateQuestion();

    }else{
      debugPrint("Incorrect");
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text("Incorrect!"));
      Scaffold.of(context).showSnackBar(snackbar);
    }
    _updateQuestion();
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1)%questionBank.length;
    });
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1)%questionBank.length;
      debugPrint("Index $_currentQuestionIndex");
    });
  }
}



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
                    Text("Total per Person",style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      color: _purple,
                    ),),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\$ ${calculateTotalPerPerson(_tipPercentage, _billAmount, _personCounter)}",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34.9,
                        color: _purple,
                      ),),
                    ),
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split",style: TextStyle(
                        color: Colors.grey.shade700
                      ),),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(_personCounter > 1){
                                  _personCounter--;
                                }else{

                                }
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: _purple.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text(
                                  "-",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0
                                ),
                                ),
                              ),
                            ),

                          ),
                          Text("$_personCounter",style: TextStyle(
                            color: _purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),),
                          InkWell(
                            onTap: (){
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: _purple.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(7.0)
                              ),
                              child: Center(
                                child: Text(
                                  "+",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0
                                ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tip",style: TextStyle(
                          color: Colors.grey.shade700
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(" \$ ${calculateTotalTip(_billAmount,
                            _tipPercentage, _personCounter)}",style: TextStyle(
                          color: _purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),),
                      )
                    ],
                  ),
                  //Slider
                  Column(
                    children: [
                      Text("$_tipPercentage %",style: TextStyle(
                        color: _purple,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),),
                      Slider(
                          min:0,
                          max:100,
                          activeColor: _purple,
                          inactiveColor: Colors.grey,
                          divisions: 10,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double newValue){
                            setState(() {
                              _tipPercentage = newValue.round();
                            });
                          }
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  calculateTotalPerPerson(int tipPercentage, double billAmount, int splitby){
    var totalPerPerson = (calculateTotalTip(billAmount, tipPercentage, splitby) + billAmount)/splitby;

    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int tipPercentage, int splitby){
    double totalTip = 0.0;

    if(billAmount < 0 || billAmount.toString().isEmpty || billAmount == null){

    }else{
      totalTip = (billAmount *tipPercentage)/100;
    }
    return totalTip;
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
