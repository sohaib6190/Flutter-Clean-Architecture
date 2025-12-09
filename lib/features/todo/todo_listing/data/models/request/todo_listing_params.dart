class TodoListingParams {
  final String docStatus;
  final String userId;
  final int? lastCount;
  final int? skipRecords;
  final String? keyword;

  TodoListingParams({
    required this.docStatus,
    this.lastCount,
    required this.userId,
    this.skipRecords,
    this.keyword,
  });

  Map<String, dynamic> toJson() {
    return {
      'docStatus': docStatus,
      if (lastCount != null) 'lastCount': lastCount,
      if (skipRecords != null) 'skipRecords': skipRecords,
      if (keyword != null && keyword!.isNotEmpty) 'keyword': keyword,
      'userId': userId,
    };
  }
}
