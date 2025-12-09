class TestFeatureModel {
  // Add your response fields here
  final String? exampleField;

  TestFeatureModel({
    this.exampleField,
  });

  factory TestFeatureModel.fromJson(Map<String, dynamic> json) {
    return TestFeatureModel(
      exampleField: json['exampleField'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exampleField': exampleField,
    };
  }
}
