import 'package:flutter/material.dart';
import 'package:flutter_office_booking/constants.dart';
import 'package:flutter_office_booking/models/message_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 225, 225),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Material(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          elevation: 3,
          child: SafeArea(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 25,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)),
                  width: 80,
                  height: 80,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'data awd  awdwa d awdad waxswad awxdwa',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/pin.svg',
                            width: 12,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'data wqd qdwqx qwdq w',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Expanded(
              child: GroupedListView<MessageModel, DateTime>(
                elements: message,
                physics: const BouncingScrollPhysics(),
                useStickyGroupSeparators: true,
                floatingHeader: true,
                order: GroupedListOrder.DESC,
                reverse: true,
                groupBy: (message) {
                  return DateTime(
                    message.date.year,
                    message.date.month,
                    message.date.day,
                  );
                },
                groupHeaderBuilder: (MessageModel message) {
                  return SizedBox(
                    height: 40,
                    child: Center(
                      child: Card(
                        elevation: 8,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            message.date.day == DateTime.now().day &&
                                    message.date.month ==
                                        DateTime.now().month &&
                                    message.date.year == DateTime.now().year
                                ? 'Hari ini'
                                : DateFormat.yMMMMd().format(message.date),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemBuilder: (ctx, MessageModel message) {
                  return Align(
                      alignment: message.isSentByMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: message.isSentByMe
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
                          color: message.isSentByMe
                              ? const Color.fromARGB(255, 25, 123, 235)
                              : Colors.white,
                          elevation: 8,
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width - 60,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              message.text,
                              style: TextStyle(
                                color: message.isSentByMe
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          )));
                },
              ),
            ),
            SizedBox(
              height: 70,
              child: TextFormField(
                onFieldSubmitted: (value) {
                  print('object');
                },
                decoration: InputDecoration(
                  hintText: 'Ketik sesuatu ...',
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        print('send');
                      },
                      child: SvgPicture.asset('assets/svg/send.svg'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
