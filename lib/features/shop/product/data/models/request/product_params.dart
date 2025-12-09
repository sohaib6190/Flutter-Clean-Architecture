class ProductParams {
  // Add your query parameters here
  final String? exampleParam;

  ProductParams({
    this.exampleParam,
  });

  Map<String, dynamic> toJson() {
    return {
      if (exampleParam != null) 'exampleParam': exampleParam,
    };
  }
}
