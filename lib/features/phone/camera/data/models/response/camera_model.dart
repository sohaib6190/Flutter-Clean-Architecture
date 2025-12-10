class CameraModel {
  // Add your response fields here
  final String? exampleField;

  CameraModel({
    this.exampleField,
  });

  factory CameraModel.fromJson(Map<String, dynamic> json) {
    return CameraModel(
      exampleField: json['exampleField'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exampleField': exampleField,
    };
  }
}
