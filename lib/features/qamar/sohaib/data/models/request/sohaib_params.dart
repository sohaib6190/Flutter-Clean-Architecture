class SohaibParams {
  // Add your query parameters here
  final String? exampleParam;

  SohaibParams({
    this.exampleParam,
  });

  Map<String, dynamic> toJson() {
    return {
      if (exampleParam != null) 'exampleParam': exampleParam,
    };
  }
}
