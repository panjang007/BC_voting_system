import 'package:davote/pages/result_2.dart';
import 'package:davote/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
          //Dummy Names = change from this

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Candidates 1",
                style: TextStyle(color: white, fontSize: 20),
              ),
              Text(
                " = ",
                style: TextStyle(color: white, fontSize: 20),
              ),

              //Here put votes per candidates functions
              Text(
                " 0 ",
                style: TextStyle(color: white, fontSize: 40),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Candidates 1",
                style: TextStyle(color: white, fontSize: 20),
              ),
              Text(
                " = ",
                style: TextStyle(color: white, fontSize: 20),
              ),

              //Here put votes per candidates functions
              Text(
                " 0 ",
                style: TextStyle(color: white, fontSize: 40),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Candidates 1",
                style: TextStyle(color: white, fontSize: 20),
              ),
              Text(
                " = ",
                style: TextStyle(color: white, fontSize: 20),
              ),

              //Here put votes per candidates functions
              Text(
                " 0 ",
                style: TextStyle(color: white, fontSize: 40),
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Divider(
              color: white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            " Total Votes = ?",
            style: TextStyle(color: white, fontSize: 20),
          ),

          const SizedBox(height: 90),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                setState(() {
                  // function to check eligible voters

                  //If yes go to this page
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => ResultPage()));
                });
              },
              child: Text(
                "        Refresh        ",
                style: TextStyle(color: black, fontSize: 15),
              )),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                setState(() {
                  // function to check eligible voters

                  //If yes go to this page
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => ResultPage2()));
                });
              },
              child: Text(
                "        Get Winner        ",
                style: TextStyle(color: black, fontSize: 15),
              ))
        ],
      ),
    );
  }
}
