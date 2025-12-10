class CameraParams {
  // Add your query parameters here
  final String? exampleParam;

  CameraParams({
    this.exampleParam,
  });

  Map<String, dynamic> toJson() {
    return {
      if (exampleParam != null) 'exampleParam': exampleParam,
    };
  }
}
