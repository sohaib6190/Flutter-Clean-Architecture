class ElectricalModel {
  // Add your response fields here
  final String? exampleField;

  ElectricalModel({
    this.exampleField,
  });

  factory ElectricalModel.fromJson(Map<String, dynamic> json) {
    return ElectricalModel(
      exampleField: json['exampleField'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exampleField': exampleField,
    };
  }
}
