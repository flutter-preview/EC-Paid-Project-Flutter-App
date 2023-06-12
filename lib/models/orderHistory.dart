class OrderHistoryData {
  final int id;
  final String date;
  final String status;
  final int totalItemsQty;

  OrderHistoryData({
    required this.id,
    required this.date,
    required this.status,
    required this.totalItemsQty,
  });

  factory OrderHistoryData.fromJson(Map<String, dynamic> json) {
    return OrderHistoryData(
      id: json['id'] as int,
      date: json['date'] as String,
      status: json['status'] as String,
      totalItemsQty: json['total_items_qty'] as int,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'status': status,
      'total_items_qty': totalItemsQty,

    };
  }
}
