import 'package:davote/utils/constant.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text('DAVOTE')),
      body: Container(
        child: Column(
          children: [Text("Hi there")],
        ),
      ),
    );
  }
}
