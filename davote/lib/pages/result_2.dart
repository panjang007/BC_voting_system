import 'package:davote/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage2 extends StatefulWidget {
  const ResultPage2({super.key});

  @override
  State<ResultPage2> createState() => _ResultPage2State();
}

class _ResultPage2State extends State<ResultPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: terquoise,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: terquoise,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(80.0),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.10,
            width: double.infinity,
            child: Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Result',
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 90),
          Text(
            " Congratulations !!! ",
            style: TextStyle(color: white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
