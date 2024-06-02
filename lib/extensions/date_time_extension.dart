extension DateTimeExtension on DateTime {
  String calculateTimeDifference(DateTime originalDate) {
    final difference = originalDate.difference(this);

    if ((difference.inDays / 7).floor() == 1) {
      return '1 week ago';
    } else if ((difference.inDays / 7).floor() > 1) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return '1 day ago';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return '1 hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return '1 minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
