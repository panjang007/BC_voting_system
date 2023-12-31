import 'package:davote/utils/constant.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';

Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString('assets/abi.json');
  String contractAddress = myContractAddress;

  final contract = DeployedContract(ContractAbi.fromJson(abi, 'VotingSystem'),
      EthereumAddress.fromHex(contractAddress));

  return contract;
}


// Dalam Video minit yang ke 40; 
