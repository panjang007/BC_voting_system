import 'package:davote/utils/constant.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';

Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString('assets/abi.json');
  String contractAddress =
      contractAddress1; // Replace with actual contract address
  final contract = DeployedContract(ContractAbi.fromJson(abi, 'VotingSystem'),
      EthereumAddress.fromHex(contractAddress));
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

Future<bool> isValidVoter(String address, Web3Client ethClient) async {
  List<dynamic> result =
      await ask('isValidVoter', [EthereumAddress.fromHex(address)], ethClient);
  return result[0] as bool;
}

Future<String> getCandidateName(int candidateID, Web3Client ethClient) async {
  List<dynamic> result =
      await ask('getCandidateName', [BigInt.from(candidateID)], ethClient);
  return result[0] as String;
}

Future<String> castVote(
    int candidateID, Web3Client ethClient, String privateKey) async {
  var response = await callFunction(
      'castVote', [BigInt.from(candidateID)], ethClient, privateKey);
  return response;
}

Future<Map<String, dynamic>> getWinner(Web3Client ethClient) async {
  List<dynamic> result = await ask('getWinner', [], ethClient);
  return {'winnerID': result[0], 'winnerName': result[1]};
}

Future<List<dynamic>> ask(
    String funcName, List<dynamic> args, Web3Client ethClient) async {
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(funcName);
  final result =
      ethClient.call(contract: contract, function: ethFunction, params: args);
  return result;
}
