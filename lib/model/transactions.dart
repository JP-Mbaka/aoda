class TRansaction {
  String? id;
  String? phoneNumber;
  String? transaction;
  String? amount;
  String? narration;
  String? date;

  TRansaction(
      {this.id,
      this.phoneNumber,
      this.transaction,
      this.amount,
      this.narration,
      this.date});

  factory TRansaction.fromJson(Map<String, dynamic> item) {
    return TRansaction(
        id: item['id'],
        phoneNumber: item['phoneNumber'],
        transaction: item['transaction'],
        amount: item['amount'],
        narration: item['narration'],
        date: item['date']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "phoneNumber": phoneNumber,
      "transaction": transaction,
      "amount": amount,
      "narration": narration,
      "date": date
    };
  }
}
