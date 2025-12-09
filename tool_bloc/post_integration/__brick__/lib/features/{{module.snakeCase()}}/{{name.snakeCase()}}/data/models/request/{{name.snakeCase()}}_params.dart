class {{name.pascalCase()}}Params {
  // Add your request parameters here
  final String? exampleParam;

  {{name.pascalCase()}}Params({
    this.exampleParam,
  });

  Map<String, dynamic> toJson() {
    return {
      if (exampleParam != null) 'exampleParam': exampleParam,
    };
  }
}
