class CsModel {
  // Add your response fields here
  final String? exampleField;

  CsModel({
    this.exampleField,
  });

  factory CsModel.fromJson(Map<String, dynamic> json) {
    return CsModel(
      exampleField: json['exampleField'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exampleField': exampleField,
    };
  }
}
