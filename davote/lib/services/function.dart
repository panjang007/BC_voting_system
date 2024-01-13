import 'package:davote/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';

String? privateKey;
int candidateID = 0;
List<int> votesPerCandidate = [1, 2, 3];

Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString('assets/abi.json');
  String contractAddress = myContractAddress;

  final contract = DeployedContract(ContractAbi.fromJson(abi, 'VotingSystem'),
      EthereumAddress.fromHex(contractAddress));

  return contract;
}

Future<String> callFunction(String functionName, List<dynamic> args,
    Web3Client ethClient, String privateKey) async {
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  privateKey = credentials as String;
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(functionName);
  final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
          contract: contract, function: ethFunction, parameters: args));
  return result;
}

Future<String> checkValidVoter(String address, Web3Client ethClient) async {
  var response = await callFunction(
      'isValidVoter', [address], ethClient, privateKey as String);

  return response;
}

Future<String> getCandidateName(String address, Web3Client ethClient) async {
  var response = await callFunction(
      'isValidVoter', [address], ethClient, privateKey as String);
  return response;
}

Future<String> castVote(String address, Web3Client ethClient) async {
  var response = await callFunction(
      'isValidVoter', [address], ethClient, privateKey as String);
  return response;
}

Future<String> getWinner(String address, Web3Client ethClient) async {
  int? winningVoteCount;
  int? winningCandidateID;
  var response = await callFunction('isValidVoter',
      [winningVoteCount, winningCandidateID], ethClient, privateKey as String);

  for (candidateID = 0; candidateID <= winningCandidateID!; candidateID++) {
    if (votesPerCandidate[candidateID] > winningCandidateID) {
      winningVoteCount = votesPerCandidate[candidateID];
      winningCandidateID = candidateID;
    }
  }

  return response;
}








// kena sambung part buat function untuk panggil function dalam smart contract

// Dalam Video minit yang ke 40; 
