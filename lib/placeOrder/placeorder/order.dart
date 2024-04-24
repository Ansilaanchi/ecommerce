class Order {
  String? id;
  String? entity;
  int? amount;
  int? amountPaid;
  int? amountDue;
  String? currency;
  String? receipt;
  dynamic offerId;
  String? status;
  int? attempts;
  List<dynamic>? notes;
  int? createdAt;

  Order({
    this.id,
    this.entity,
    this.amount,
    this.amountPaid,
    this.amountDue,
    this.currency,
    this.receipt,
    this.offerId,
    this.status,
    this.attempts,
    this.notes,
    this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['id'] as String?,
        entity: json['entity'] as String?,
        amount: json['amount'] as int?,
        amountPaid: json['amount_paid'] as int?,
        amountDue: json['amount_due'] as int?,
        currency: json['currency'] as String?,
        receipt: json['receipt'] as String?,
        offerId: json['offer_id'] as dynamic,
        status: json['status'] as String?,
        attempts: json['attempts'] as int?,
        notes: json['notes'] as List<dynamic>?,
        createdAt: json['created_at'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'entity': entity,
        'amount': amount,
        'amount_paid': amountPaid,
        'amount_due': amountDue,
        'currency': currency,
        'receipt': receipt,
        'offer_id': offerId,
        'status': status,
        'attempts': attempts,
        'notes': notes,
        'created_at': createdAt,
      };
}
