import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import '../../models/message_model.dart';
import '../../view_models/chat_view_model.dart';

class MessageList extends StatelessWidget {
  const MessageList({
    Key? key,
    required this.message,
    required this.userId,
  }) : super(key: key);

  final List<GetAllChatByUsersIdAndBuildingId> message;
  final int userId;

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatViewModel>(context);
    return GroupedListView<GetAllChatByUsersIdAndBuildingId, DateTime>(
      elements: message,
      physics: const BouncingScrollPhysics(),
      useStickyGroupSeparators: true,
      floatingHeader: true,
      order: GroupedListOrder.DESC,
      reverse: true,
      groupBy: (message) {
        return DateTime(
          chatProvider.stringDate.parse(message.date!).year,
          chatProvider.stringDate.parse(message.date!).month,
          chatProvider.stringDate.parse(message.date!).day,
        );
      },
      groupHeaderBuilder: (GetAllChatByUsersIdAndBuildingId message) {
        return SizedBox(
          height: 40,
          child: Center(
            child: Card(
              elevation: 8,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  chatProvider.parseMessageDate(message.date),
                ),
              ),
            ),
          ),
        );
      },
      itemBuilder: (ctx, GetAllChatByUsersIdAndBuildingId message) {
        return Align(
          alignment: message.sender!.id == userId.toString()
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: message.sender!.id == userId.toString()
                  ? const BorderRadius.only(
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(0),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
            ),
            color: message.sender!.id == userId.toString()
                ? const Color.fromARGB(255, 25, 123, 235)
                : Colors.white,
            elevation: 8,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 60,
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                message.message!,
                style: TextStyle(
                  color: message.sender!.id == userId.toString()
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
