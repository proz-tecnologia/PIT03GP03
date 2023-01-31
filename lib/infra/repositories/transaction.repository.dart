import 'package:green/constants/transaction/transactions_green.dart';
import 'package:green/models/api_response.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getCurrent();
  Future<APIResponse<Transaction>> add(Transaction item);
  Future<APIResponse<bool>> remove(Transaction item);

  //Future<APIResponse<bool>> update(Transaction item);
}
