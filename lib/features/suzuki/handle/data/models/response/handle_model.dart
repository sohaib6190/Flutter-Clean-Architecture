class HandleModel {
  // Add your response fields here
  final String? exampleField;

  HandleModel({
    this.exampleField,
  });

  factory HandleModel.fromJson(Map<String, dynamic> json) {
    return HandleModel(
      exampleField: json['exampleField'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exampleField': exampleField,
    };
  }
}
