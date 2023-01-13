import '../../constants/transaction/transactions_green.dart';
import '../../models/api_response.dart';

abstract class TransactionRepository {
  Future<APIResponse<List<Transaction>>> getMonth(DateTime dateSelected);
  Future<APIResponse<Transaction>> add(Transaction item);
  Future<APIResponse<bool>> remove(Transaction item);
}
