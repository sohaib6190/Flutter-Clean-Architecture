enum ITRDocStatus {
  pending,
  completed,
  cancelled,
  open;

  String get value {
    switch (this) {
      case ITRDocStatus.pending:
        return 'Pending';
      case ITRDocStatus.completed:
        return 'Completed';
      case ITRDocStatus.cancelled:
        return 'Cancelled';
      case ITRDocStatus.open:
        return 'Open';
    }
  }
}

