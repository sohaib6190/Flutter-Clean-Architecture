class CartListingParams {
  // Add your query parameters here
  final String? exampleParam;

  CartListingParams({
    this.exampleParam,
  });

  Map<String, dynamic> toJson() {
    return {
      if (exampleParam != null) 'exampleParam': exampleParam,
    };
  }
}
