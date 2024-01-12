import 'dart:js_util';

import 'package:davote/utils/constant.dart';
import 'package:flutter/services.dart';

import 'package:web3dart/web3dart.dart';

// Function to load the contract (you already have this)
Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString('assets/abi.json');
  String contractAddress = myContractAddress;

  final contract = DeployedContract(
    ContractAbi.fromJson(abi, 'VotingSystem'),
    EthereumAddress.fromHex(contractAddress),
  );

  return contract;
}

Future<String> callFunction(String funcname, List<dynamic> args,
    Web3Client ethClient, String privateKey) async {
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(funcname);
  final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: ethFunction,
        parameters: args,
      ),
      chainId: null,
      fetchChainIdFromNetworkId: true);
  return result;
}

Future<List<dynamic>> ask(
    String funcName, List<dynamic> args, Web3Client ethClient) async {
  final contract = await loadContract();
  final ethFunction = contract.function(funcName);
  final result =
      ethClient.call(contract: contract, function: ethFunction, params: args);
  return result;
}

// Function to check voter eligibility
// Future<bool> isVoterEligible(
//     DeployedContract contract, EthereumAddress voterAddress) async {
//   final result = await contract.call<bool>('isValidVoter', [voterAddress]);
//   return result;
// }

// Function to get candidate name
Future<String> getCandidateName(
    DeployedContract contract, int candidateID) async {
  final result =
      await callFunction('getCandidateName', [BigInt.from(candidateID)]);
  return result;
}

// Function to cast a vote
Future<void> castVote(DeployedContract contract, int candidateID) async {
  await callFunction('castVote', [BigInt.from(candidateID)]);
}

// Function to get the winner
// Future<List<dynamic>> getWinner(DeployedContract contract) async {
//   final result = await contract.call('getWinner');
//   return result;
// }
