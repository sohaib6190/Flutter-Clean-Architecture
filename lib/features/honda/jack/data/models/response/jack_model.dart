class JackModel {
  // Add your response fields here
  final String? exampleField;

  JackModel({
    this.exampleField,
  });

  factory JackModel.fromJson(Map<String, dynamic> json) {
    return JackModel(
      exampleField: json['exampleField'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exampleField': exampleField,
    };
  }
}
