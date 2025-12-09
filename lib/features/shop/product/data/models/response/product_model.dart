class ProductModel {
  // Add your response fields here
  final String? exampleField;

  ProductModel({
    this.exampleField,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      exampleField: json['exampleField'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exampleField': exampleField,
    };
  }
}
