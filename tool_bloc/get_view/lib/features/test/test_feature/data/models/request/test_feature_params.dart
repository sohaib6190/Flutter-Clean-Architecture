class TestFeatureParams {
  // Add your query parameters here
  final String? exampleParam;

  TestFeatureParams({
    this.exampleParam,
  });

  Map<String, dynamic> toJson() {
    return {
      if (exampleParam != null) 'exampleParam': exampleParam,
    };
  }
}
