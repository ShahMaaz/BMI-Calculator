import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constant.dart';

enum Gender { male, female }

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

  // Color maleCardColor = inActiveCardColor;
  // Color feMaleCardColor = inActiveCardColor;

/*  void updateColor(Gender gender){
    if(gender == Gender.male){
      if(maleCardColor == inActiveCardColor){
        maleCardColor = activeCardColor;
        feMaleCardColor = inActiveCardColor;
      }else{
        maleCardColor = inActiveCardColor;
      }

    }else{
      if(feMaleCardColor == inActiveCardColor){
        feMaleCardColor = activeCardColor;
        maleCardColor = inActiveCardColor;
      }else{
        feMaleCardColor = inActiveCardColor;
      }
    }
  }*/

  Gender selectedGander = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;
  int bmi = 0;

  dynamic calculateBMI(){
    return weight / ( height * height);
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGander = Gender.male;
                        });
                      },
                      cardChild: IconContent(
                        cardIcon: Icons.male,
                        label: 'MALE',
                      ),
                      myColor: selectedGander == Gender.male
                          ? KActiveCardColor
                          : KInActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGander = Gender.female;
                        });
                      },
                      cardChild: IconContent(
                        cardIcon: Icons.female,
                        label: 'FEMALE',
                      ),
                      myColor: selectedGander == Gender.female
                          ? KActiveCardColor
                          : KInActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                myColor: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Height',
                      style: KLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: KNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: KLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: KActiveLabelColor,
                        inactiveTrackColor: KInActiveLabelColor,
                        thumbColor: KActiveLabelColor,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                        overlayColor: Color(0x29FFFFFF),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 24)
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 30,
                        max: 220,
                        onChanged: (double newHeightValue) {
                          setState(() {
                            height = newHeightValue.round();
                            calculateBMI();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      myColor: KActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Weight',
                          style: KLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: KNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: Icons.minimize,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      myColor: KActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Age',
                          style: KLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: KNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: Icons.add,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: Icons.minimize,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: KBottomContainerHeight,
              width: double.infinity,
              color: KBottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  calculateBMI().toString(),
                  style: KNumberTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
