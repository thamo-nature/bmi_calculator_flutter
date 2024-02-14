import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './icon_content.dart';
import './reusable_card.dart';
import './result_page.dart';
import './bmi_class.dart';

const double bottomContainerHeight = 80;
const Color bottomContainerColor = Colors.pink;

const Color inActiveCardColor = Color.fromRGBO(15, 165, 240, 1);
const Color activeColor = Color.fromARGB(255, 226, 3, 77);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inActiveCardColor;

  Color feMaleCardColor = inActiveCardColor;

  void updateselectedGender(int gender) {
    if (gender == 1) {
      if (maleCardColor == inActiveCardColor) {
        maleCardColor = activeColor;
      } else {
        maleCardColor = inActiveCardColor;
      }
    }

    if (gender == 2) {
      if (feMaleCardColor == inActiveCardColor) {
        feMaleCardColor = activeColor;
      } else {
        feMaleCardColor = inActiveCardColor;
      }
    }
  }

  int heightUser = 150;

  int startWeight = 50;

  int startAge = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.green,

        appBar: AppBar(
          //backgroundColor: Colors.lightGreen,
          title: const Center(
            child: Text('BMI Calculator'),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              //flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateselectedGender(1);
                        });
                      },
                      child: ReusableCard(
                        colour: maleCardColor,
                        genderCard: const IconContent(
                          genderText: 'Male',
                          genderIcon: FontAwesomeIcons.mars,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateselectedGender(2);
                        });
                      },
                      child: ReusableCard(
                        colour: feMaleCardColor,
                        genderCard: const IconContent(
                          genderText: 'Female',
                          genderIcon: FontAwesomeIcons.venus,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: inActiveCardColor,
                genderCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Height',
                      style: TextStyle(fontSize: 25),
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,\
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          heightUser.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(
                            height: 1.5,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                        ),
                        Slider(
                            value: heightUser.toDouble(),
                            min: 120,
                            max: 220,
                            activeColor: Colors.pink,
                            inactiveColor: Colors.greenAccent,
                            onChanged: (valuesFromTheCursor) {
                              setState(() {
                                heightUser = valuesFromTheCursor.toInt();
                              });
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.blue,
                      genderCard: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Weight'),
                          Text(startWeight.toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    startWeight--;
                                  });
                                },
                                child: const Icon(FontAwesomeIcons.minus),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    startWeight++;
                                  });
                                },
                                child: const Icon(FontAwesomeIcons.plus),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: Colors.blue,
                      genderCard: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Age'),
                          Text(startAge.toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    startAge--;
                                  });
                                },
                                child: const Icon(FontAwesomeIcons.minus),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    startAge++;
                                  });
                                },
                                child: const Icon(FontAwesomeIcons.plus),
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
            GestureDetector(
              onTap: () {
                BMICalculator userBMI =
                    BMICalculator(height: heightUser, weight: startWeight);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FinalResult(
                      userBMI: userBMI.findBMI(),
                      userCondition: userBMI.condition(),
                    );
                  }),
                );
              },
              child: Container(
                width: double.infinity,
                height: bottomContainerHeight,
                color: bottomContainerColor,
                child: const Center(child: Text('CALCULATE')),
              ),
            ),
          ],
        ));
  }
}
