import 'package:hive_flutter/adapters.dart';
import 'package:mtracker/db/model/trasaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DbHelper {
  Future addData(
      int? amount, DateTime date, String category, String type) async {
    final box = Hive.box('money');
    var value = {
      'amount': amount,
      'date': date,
      'category': category,
      'type': type,
    };
    box.add(value);
  }

  Future<List<TransactionModel>> fetch() async {
    final box = Hive.box('money');
    if (box.values.isEmpty) {
      return Future.value([]);
    } else {
      List<TransactionModel> items = [];
      box.toMap().values.forEach(
        (element) {
          items.add(
            TransactionModel(
              element['amount'] as int,
              element['date'] as DateTime,
              element['category'],
              element['type'],
            ),
          );
        },
      );
      return items;
    }
  }

  Future deleteData(int index) async {
    final box = Hive.box('money');
    await box.deleteAt(index);
  }

  Future updateData(int? amount, DateTime date, String category, String type,
      int index) async {
    final box = Hive.box('money');
    var value = {
      'amount': amount,
      'date': date,
      'category': category,
      'type': type
    };
    box.putAt(index, value);
  }

  void resetData() {
    final box = Hive.box('money');
    box.clear();
  }

  void resetSharedPreference() async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.clear();
  }
}
