class ProductAddModel {
  // Add your response fields here
  final int? id;
  final String? title;
  final int? userId;

  ProductAddModel({
    this.id,
    this.title,
    this.userId,
  });

  factory ProductAddModel.fromJson(Map<String, dynamic> json) {
    return ProductAddModel(
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'userId': userId,
    };
  }
}
