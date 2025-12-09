class AddProductionOrderITRParams {
  String? fromWareHouseCode;
  String? toWareHouseCode;
  //String documentType;
  String? documentAbsoluteEntry;
  String? documentNumber;
  List<TransferItem> items;

  AddProductionOrderITRParams({
    required this.fromWareHouseCode,
    this.toWareHouseCode,
    // required this.documentType,
    required this.documentAbsoluteEntry,
    required this.documentNumber,
    required this.items,
  });

  factory AddProductionOrderITRParams.fromJson(Map<String, dynamic> json) {
    return AddProductionOrderITRParams(
      fromWareHouseCode: json['fromWareHouseCode'] ?? '',
      toWareHouseCode: json['toWareHouseCode'] ?? '',
      //documentType: json['documentType'] ?? '',
      documentAbsoluteEntry: json['documentAbsoluteEntry'] ?? 0,
      documentNumber: json['documentNumber'] ?? 0,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => TransferItem.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fromWareHouseCode': fromWareHouseCode,
      'toWareHouseCode': toWareHouseCode,
      // 'documentType': documentType,
      'documentAbsoluteEntry': documentAbsoluteEntry,
      'documentNumber': documentNumber,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

class TransferItem {
  String itemCode;
  double? quantity;
  double? baseQuantity;
  double? plannedQuantity;
  int? lineNumber;
  String? type;
  TransferItem({
    required this.itemCode,
    required this.quantity,
    this.baseQuantity,
    this.lineNumber,
    this.plannedQuantity,
    this.type,
  });

  factory TransferItem.fromJson(Map<String, dynamic> json) {
    return TransferItem(
      itemCode: json['itemCode'] ?? '',
      quantity: json['quantity'],
      baseQuantity: json['baseQuantity'],
      plannedQuantity: json['plannedQuantity'],
      lineNumber: json['lineNumber'],
      type: json['itemType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemCode': itemCode,
      'quantity': quantity,
      'baseQuantity': baseQuantity,
      'plannedQuantity': plannedQuantity,
      'lineNumber': lineNumber,
      'itemType': type,
    };
  }
}
