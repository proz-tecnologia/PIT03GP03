import '../../repository/transaction_meuGreen.dart';

List<money> geter() {
  money transaction = money();
  transaction.name = 'transaction';
  transaction.fee = '650';
  transaction.time = 'today';
  transaction.image = 'bank.png';
  return [transaction];
}
