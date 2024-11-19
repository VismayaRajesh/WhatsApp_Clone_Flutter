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

class CallModel{
  final String url;
  final String names;
  final String time;
  final bool callstatus;
  final bool attended;
  final bool calltype;

  CallModel({required this.url, required this.names, required this.time, required this.callstatus, required this.attended, required this.calltype});
}

class Statusmodel {
  final String url;
  final String name;
  final String time;
  final bool isSeen;
  final int numberofStatus;

  Statusmodel({
    required this.url,
    required this.name,
    required this.time,
    required this.isSeen,
    this.numberofStatus = 1
  });
}

class StatusSeen {
  final String url;
  final String name;
  final String time;
  final bool isSeen;

  StatusSeen({
    required this.url,
    required this.name,
    required this.time,
    required this.isSeen,
  });
}

class Contact {
  final String name;
  final String subtitle;
  final String url;

  Contact({required this.name, required this.subtitle, required this.url});
}