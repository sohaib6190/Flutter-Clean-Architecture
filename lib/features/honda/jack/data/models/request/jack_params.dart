class JackParams {
  // Add your query parameters here
  final String? exampleParam;

  JackParams({
    this.exampleParam,
  });

  Map<String, dynamic> toJson() {
    return {
      if (exampleParam != null) 'exampleParam': exampleParam,
    };
  }
}
