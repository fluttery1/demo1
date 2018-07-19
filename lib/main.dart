import 'package:flutter/material.dart';
void main(){
  runApp(
    new MaterialApp(
    title: "BMI",
    home: new BMI(),
    )
  );
}
class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController _age = new TextEditingController();
  final TextEditingController _height = new TextEditingController();
  final TextEditingController _weight = new TextEditingController();
  double Result;
  String bmi = "BMI";
  String c = " ";
  void _calcu(){
//    Underweight = <18.5
//    Normal weight = 18.5–24.9
//    Overweight = 25–29.9
//    Obesity = BMI of 30 or greater


    setState(() {
    double weight = double.parse(_weight.text);
    double inch = double.parse(_height.text)*12;
   Result = weight/(inch*inch)*703;
   Result = double.parse(Result.toStringAsFixed(2));
   bmi = "Your BMI: $Result";

   if(Result<18.5){
     c = "UnderWeight";

   }
    else if(Result>18.5 && Result<24.9){
      c = "Normal Weight";
    }
    else if(Result>25 && Result<29.9){
      c = "OverWeight";
    }
    else{
      c = "Obesity";
    }
   //debugPrint("$Result");
  });

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
      child: ListView(
        padding: EdgeInsets.all(3.2),
        children: <Widget>[
          new Image.asset("images/bmi.png",
            color: Colors.pinkAccent,
            height: 60.0,
            width: 60.0,),
          new Container(
            margin: EdgeInsets.only(top: 20.0),
            height: 300.0,
            color: Colors.black12,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  controller: _age,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Age",
                    hintText: "e.g 34",
                    icon: new Icon(Icons.person),
                  ),
                ),
                new TextField(
                  controller: _height,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Height In Feet",
                    hintText: "e.g 6.5",
                    icon: new Icon(Icons.assessment),
                  ),
                ),
                new TextField(
                  controller: _weight,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Weight In lb",
                    hintText: "e.g 180",
                    icon: new Icon(Icons.line_weight),
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 10.0)),
                new Container(
                  child: new RaisedButton(
                    onPressed: _calcu,
                    color: Colors.pinkAccent,
                    child: new Text("Calculate",style: new TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
          new Column(
           children: <Widget>[
             new Text("$bmi ",
               style: new TextStyle(color: Colors.blue,fontSize: 24.0),),
             new Text("$c",style: new TextStyle(color: Colors.pinkAccent,fontSize: 24.0),),

           ],
          )
        ],
      ),
    ),
    );
  }
}
