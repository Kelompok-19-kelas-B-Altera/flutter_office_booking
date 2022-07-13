class MessageModel {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  MessageModel({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}

List<MessageModel> message = [
  MessageModel(text: 'ada', date: DateTime.now(), isSentByMe: false),
  MessageModel(
      text: 'text', date: DateTime(2017, 9, 7, 17, 30), isSentByMe: true),
  MessageModel(
      text: 'gadwqw wqdqw dqwd wq dqwsasdawd awdawsdawd awdawsdsa',
      date: DateTime.now(),
      isSentByMe: true),
  MessageModel(
      text: 'trr', date: DateTime(2017, 9, 13, 17, 30), isSentByMe: false),
  MessageModel(
      text: 'trr', date: DateTime(2021, 7, 13, 17, 30), isSentByMe: false),
  MessageModel(
      text: 'trr', date: DateTime(2021, 9, 13, 17, 30), isSentByMe: false),
  MessageModel(
      text: 'trr', date: DateTime(2017, 9, 13, 17, 30), isSentByMe: false),
  MessageModel(text: 'aawww', date: DateTime.now(), isSentByMe: true),
  MessageModel(text: 'gad', date: DateTime.now(), isSentByMe: true),
  MessageModel(
      text: 'trr dawdawda wda dawdawdawsxwda wdaxawd awxasswd awdawd awdaswa ',
      date: DateTime.now(),
      isSentByMe: false),
  MessageModel(text: 'aawww', date: DateTime.now(), isSentByMe: true),
  MessageModel(text: 'gad', date: DateTime.now(), isSentByMe: true),
  MessageModel(text: 'trr', date: DateTime.now(), isSentByMe: false),
  MessageModel(text: 'aawww', date: DateTime.now(), isSentByMe: true),
  MessageModel(text: 'gad', date: DateTime.now(), isSentByMe: true),
  MessageModel(text: 'trr', date: DateTime.now(), isSentByMe: false),
  MessageModel(text: 'aawww', date: DateTime.now(), isSentByMe: true),
  MessageModel(text: 'gad', date: DateTime.now(), isSentByMe: true),
  MessageModel(text: 'trr', date: DateTime.now(), isSentByMe: false),
  MessageModel(text: 'aawww', date: DateTime.now(), isSentByMe: true),
];
