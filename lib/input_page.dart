import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  /* Widget _ReusableCard(){
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }*/
  /*ThemeData myTheme = ThemeData();
  void setTheme(ThemeData themeData){
    setState(() {
    myTheme = themeData;
    });
  }

 ThemeData getTheme(){
    return myTheme;
  }*/

  Color maleCardColor = activeCardColor;
  Color feMaleCardColor = inActiveCardColor;


  void updateColor(Gender gender){
    if(gender == Gender.male){
      // if(maleCardColor == inActiveCardColor){
        maleCardColor = activeCardColor;
        feMaleCardColor = inActiveCardColor;
      // }else{
      //   maleCardColor = inActiveCardColor;
      // }

    }else{
      // if(feMaleCardColor == inActiveCardColor){
        feMaleCardColor = activeCardColor;
        maleCardColor = inActiveCardColor;
      // }else{
      //   feMaleCardColor = inActiveCardColor;
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("BMI Calculator"),
            centerTitle: true,
/*            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  setTheme(ThemeData.dark());
                },
                child: Icon(Icons.nightlight_round,
                color: Colors.white,),
              ),
              Visibility(
                child: FlatButton(
                  onPressed: () {
                      setTheme(ThemeData.light());
                  },
                  child: Icon(Icons.wb_sunny_rounded,
                  color: Colors.yellow,),
                ),
              ),
            ],*/
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            updateColor(Gender.male);
                          });
                        },
                        child: ReusableCard(
                          cardChild: IconContent(
                            cardIcon: Icons.male,
                            label: 'MALE',
                          ),
                          myColor: maleCardColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            updateColor(Gender.female);
                          });
                        },
                        child: ReusableCard(
                          cardChild: IconContent(
                            cardIcon: Icons.female,
                            label: 'FEMALE',
                          ),
                          myColor: feMaleCardColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(myColor: activeCardColor),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        myColor: activeCardColor,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        myColor: activeCardColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: bottomContainerHeight,
                width: double.infinity,
                color: bottomContainerColor,
                margin: EdgeInsets.only(top: 10),
              )
            ],
          )),
    );
  }
}
