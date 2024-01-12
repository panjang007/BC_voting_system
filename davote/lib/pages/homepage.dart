import 'package:davote/pages/votepage.dart';
import 'package:davote/utils/colors.dart';
import 'package:davote/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the correct Client class
import 'package:web3dart/web3dart.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  http.Client? httpClient; // Use http.Client for clarity
  Web3Client? ethClient;

  @override
  void initState() {
    httpClient = http.Client(); // Create a new HTTP client instance
    ethClient = Web3Client(Infura_Url, httpClient!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
                      'DAVOTE',
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 180),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 40),
                Text(
                  'Voters',
                  style: TextStyle(color: white, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: white,
                  filled: true,
                  labelText: 'Enter your Ethereum Addresss',
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  setState(() {
                    // function to check eligible voters

                    //If yes go to this page
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => votepage()));
                  });
                },
                child: Text(
                  "Check",
                  style: TextStyle(color: white),
                ))
          ],
        ),
      ),
    );
  }
}
