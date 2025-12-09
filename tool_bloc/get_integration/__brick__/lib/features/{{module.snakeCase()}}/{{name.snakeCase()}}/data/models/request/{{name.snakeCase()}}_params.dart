class {{name.pascalCase()}}Params {
  // Add your query parameters here
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
