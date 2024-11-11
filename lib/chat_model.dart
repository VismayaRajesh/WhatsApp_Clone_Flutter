class Chat {
  final String url;
  final String names;
  final String message;
  final String time;
  final bool readstatus;
  final bool viewMsg;
  final bool msgRevd;
  final int unreadCount;

  Chat({
    required this.url,
    required this.names,
    required this.message,
    required this.time,
    required this.readstatus,
    required this.viewMsg,
    required this.msgRevd,
    this.unreadCount = 0,
  });
}
