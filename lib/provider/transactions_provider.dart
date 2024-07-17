import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:logger/logger.dart';

var logger = Logger();

class TransactionsProvider extends ChangeNotifier {
  Map<int, Map<String, dynamic>> _transactions = {};

  Map<int, Map<String, dynamic>> get transactions => _transactions;

  Future<void> fetchTransactions() async {
    final response = await Supabase.instance.client.from('transactions');

    logger.d(response);

    //  TODO: Filter for active and inactive transactions, providing getters for each type of transaction
    notifyListeners();
  }
}
