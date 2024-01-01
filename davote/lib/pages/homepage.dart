import 'package:davote/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/src/client.dart';
import 'package:web3dart/web3dart.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Client? httpClient;
  Web3Client? ethClient;

  @override
  void initState() {
    httpClient = Client as Client?;
    ethClient = Web3Client(Infura_Url, httpClient as Client);

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
