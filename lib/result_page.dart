import 'package:flutter/material.dart';

class FinalResult extends StatelessWidget {
  const FinalResult({
    super.key,
    required this.userCondition,
    required this.userBMI,
  });

  final String userCondition;
  final String userBMI;

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
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(color: Colors.pink, fontSize: 20),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                color: Colors.grey,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(userCondition),
                    Text(
                      userBMI,
                      style: const TextStyle(fontSize: 50),
                    ),
                    const Text(
                      'Whatever Your BMI Live Beautifully',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.pink,
              child: const Center(child: Text('RE CALCULATE')),
            ),
          ),
        ],
      ),
    );
  }
}
