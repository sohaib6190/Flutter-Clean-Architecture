class MechanicalModel {
  // Add your response fields here
  final String? exampleField;

  MechanicalModel({
    this.exampleField,
  });

  factory MechanicalModel.fromJson(Map<String, dynamic> json) {
    return MechanicalModel(
      exampleField: json['exampleField'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exampleField': exampleField,
    };
  }
}
