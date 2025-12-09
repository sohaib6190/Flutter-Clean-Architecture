class TodoListingModel {
  final bool remainingQuantity;
  final bool inventoryTransfer;
  final bool transferReceive;
  final bool issuanceRemaining;
  final bool unpostedIssuanceGreaterThanTR;
  final double? issuancePercentage;

  TodoListingModel({
    required this.remainingQuantity,
    required this.inventoryTransfer,
    required this.transferReceive,
    required this.issuanceRemaining,
    required this.unpostedIssuanceGreaterThanTR,
    this.issuancePercentage,
  });

  factory TodoListingModel.fromJson(Map<String, dynamic> json) {
    return TodoListingModel(
      remainingQuantity: json['remainingQuantity'],
      inventoryTransfer: json['inventoryTransfer'],
      transferReceive: json['transferReceive'],
      issuanceRemaining: json['issuanceRemaining'],
      issuancePercentage: json['issuancePercentage'],
      unpostedIssuanceGreaterThanTR: json['unpostedIssuanceGreaterThanTR'],
    );
  }
}
