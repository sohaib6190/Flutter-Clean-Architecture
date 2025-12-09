
class CreateGoodIssueRequestModel {
  final String warehouse;
  final String itemCode;
  final double quantity;
  final String uom;
  final double openQuantity;
  final String barCode;
  final String binLocation;
  final String? resource;

  const CreateGoodIssueRequestModel({
    required this.warehouse,
    required this.itemCode,
    required this.quantity,
    required this.uom,
    required this.openQuantity,
    required this.barCode,
    required this.binLocation,
    this.resource,
  });

  factory CreateGoodIssueRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateGoodIssueRequestModel(
      warehouse: json['whsCode'] ?? '',
      itemCode: json['itemCode'] ?? '',
      quantity: (json['quantity'] ?? 0).toDouble(),
      uom: json['uoM'] ?? '',
      openQuantity: (json['openQuantity'] ?? 0).toDouble(),
      barCode: json['barCode'] ?? '',
      binLocation: json['binCode'] ?? '',
      resource: json['resource'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'whsCode': warehouse,
      'itemCode': itemCode,
      'binCode': binLocation,
      'quantity': quantity,
      'resource': resource,
      'uoM': uom,
      'barCode': barCode,
    };
    //data.removeWhere((key, value) => value == null || value == '');

    return data;
  }
}
