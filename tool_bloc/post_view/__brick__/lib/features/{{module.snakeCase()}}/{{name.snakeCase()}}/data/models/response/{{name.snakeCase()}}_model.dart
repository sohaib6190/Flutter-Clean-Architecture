class {{name.pascalCase()}}Model {
  // Add your response fields here
  final String? exampleField;

  {{name.pascalCase()}}Model({
    this.exampleField,
  });

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{name.pascalCase()}}Model(
      exampleField: json['exampleField'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exampleField': exampleField,
    };
  }
}
