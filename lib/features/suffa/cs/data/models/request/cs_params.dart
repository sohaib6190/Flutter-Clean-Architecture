class CsParams {
  // Add your query parameters here
  final String? exampleParam;

  CsParams({
    this.exampleParam,
  });

  Map<String, dynamic> toJson() {
    return {
      if (exampleParam != null) 'exampleParam': exampleParam,
    };
  }
}
