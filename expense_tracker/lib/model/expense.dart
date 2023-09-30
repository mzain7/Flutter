import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { work, leisure, travel, food }

class Expense {
  final String id, title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}
