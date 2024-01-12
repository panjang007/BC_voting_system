import 'package:davote/pages/result.dart';
import 'package:davote/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class votepage extends StatefulWidget {
  const votepage({super.key});

  @override
  State<votepage> createState() => _votepageState();
}

class _votepageState extends State<votepage> {
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
                    'Voting Page',
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 90),
          //Dummy Names = change from this
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Candidate 1',
                style: TextStyle(
                    color: black, fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Candidate 2',
                style: TextStyle(
                    color: black, fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Candidate 3',
                style: TextStyle(
                    color: black, fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),

          SizedBox(height: 150),

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
                "        Vote        ",
                style: TextStyle(color: black, fontSize: 15),
              )),
        ],
      ),
    );
  }
}
