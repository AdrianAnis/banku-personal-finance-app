class TransactionModel {
  final String id;
  final double amount;
  final String type;
  final String title;
  final String category;
  final DateTime date;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.type,
    required this.title,
    required this.category,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'type': type,
      'title': title,
      'category': category,
      'date': date.toIso8601String(),
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      amount: map['amount'],
      type: map['type'],
      title: map['title'],
      category: map['category'],
      date: DateTime.parse(map['date']),
    );
  }
}
