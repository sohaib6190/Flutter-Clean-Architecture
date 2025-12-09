class CartListingModel {
  // Add your response fields here
  final String? exampleField;

  CartListingModel({
    this.exampleField,
  });

  factory CartListingModel.fromJson(Map<String, dynamic> json) {
    return CartListingModel(
      exampleField: json['exampleField'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exampleField': exampleField,
    };
  }
}
