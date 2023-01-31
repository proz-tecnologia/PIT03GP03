import 'package:green/constants/transaction/transactions_green.dart';
import 'package:green/infra/repositories/transaction.repository.dart';
import 'package:green/infra/services/transaction.service.dart';
import 'package:green/models/api_response.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionService _service;

  TransactionRepositoryImpl(this._service);

  @override
  Future<APIResponse<Transaction>> add(Transaction item) async {
    final docRef = await _service.add(item.toMap());
    item.id = docRef.id;

    return APIResponse.success(item);
  }

  @override
  Future<APIResponse<bool>> remove(Transaction item) async {
    final result = await _service.remove(item.id!);

    if (result) {
      return APIResponse.success(result);
    } else {
      return APIResponse.error("Operação falhou!");
    }
  }

  @override
  Future<List<Transaction>> getCurrent() async {
    final querySnapshot = await _service.getCurrent();

    List<Transaction> listTransactions = [];

    for (var doc in querySnapshot.docs) {
      Transaction item =
          Transaction.fromFirestore(doc.data() as Map<String, dynamic>);

      item.id = doc.id;

      listTransactions.add(item);
    }

    return listTransactions;
  }
}
