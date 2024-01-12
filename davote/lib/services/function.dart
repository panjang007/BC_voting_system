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

// Function to check voter eligibility
Future<bool> isVoterEligible(
    DeployedContract contract, EthereumAddress voterAddress) async {
  final result = await contract.call<bool>('isValidVoter', [voterAddress]);
  return result;
}

// Function to get candidate name
Future<String> getCandidateName(
    DeployedContract contract, int candidateID) async {
  final result = await contract
      .call<String>('getCandidateName', [BigInt.from(candidateID)]);
  return result;
}

// Function to cast a vote
Future<void> castVote(DeployedContract contract, int candidateID) async {
  await contract.send('castVote', [BigInt.from(candidateID)]);
}

// Function to get the winner
Future<List<dynamic>> getWinner(DeployedContract contract) async {
  final result = await contract.call('getWinner');
  return result;
}
