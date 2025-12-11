class ProductListingParams {
  // Add your query parameters here
  final String? exampleParam;

  ProductListingParams({
    this.exampleParam,
  });

  Map<String, dynamic> toJson() {
    return {
      if (exampleParam != null) 'exampleParam': exampleParam,
    };
  }
}
