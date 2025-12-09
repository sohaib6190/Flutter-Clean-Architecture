class ElectricalParams {
  // Add your request parameters here
  final String? exampleParam;

  ElectricalParams({
    this.exampleParam,
  });

  Map<String, dynamic> toJson() {
    return {
      if (exampleParam != null) 'exampleParam': exampleParam,
    };
  }
}
