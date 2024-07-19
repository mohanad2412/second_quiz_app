import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final questionList = <String>[
    'What is the capital of egypt',
    'What is the capital of USA',
    'What is the capital of spain'
  ];
  final iconList = <Icon>[];
  var trueButton = true;
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizzler App'),
      ),
      body: Column(
        children: [
          Text(questionList[index]),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
              visible: trueButton,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (index < questionList.length - 1) {
                      iconList.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                      index++;
                    } else if (index > questionList.length) {
                      trueButton = false;
                      Get.snackbar('Wrong', 'This is wrong');
                    }
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                iconList.add(
                  Icon(
                    Icons.check,
                    color: Colors.red,
                  ),
                );
              });
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(
              'False',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Row(
            children: iconList,
          )
        ],
      ),
    );
  }
}
