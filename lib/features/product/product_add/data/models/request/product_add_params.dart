class ProductAddParams {
  // Add your request parameters here
  final String? title;
  final int? userId;

  ProductAddParams({
    this.title,
    this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      if (title != null) 'title': title,
      if (userId != null) 'userId': userId,
    };
  }
}
