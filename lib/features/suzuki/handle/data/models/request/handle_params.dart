class HandleParams {
  // Add your query parameters here
  final String? exampleParam;

  HandleParams({
    this.exampleParam,
  });

  Map<String, dynamic> toJson() {
    return {
      if (exampleParam != null) 'exampleParam': exampleParam,
    };
  }
}
