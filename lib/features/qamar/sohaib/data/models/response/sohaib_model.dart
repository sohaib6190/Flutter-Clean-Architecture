class SohaibModel {
  // Add your response fields here
  final String? exampleField;

  SohaibModel({
    this.exampleField,
  });

  factory SohaibModel.fromJson(Map<String, dynamic> json) {
    return SohaibModel(
      exampleField: json['exampleField'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exampleField': exampleField,
    };
  }
}
