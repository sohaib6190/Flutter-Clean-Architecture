class MechanicalParams {
  // Add your query parameters here
  final String? exampleParam;

  MechanicalParams({
    this.exampleParam,
  });

  Map<String, dynamic> toJson() {
    return {
      if (exampleParam != null) 'exampleParam': exampleParam,
    };
  }
}
