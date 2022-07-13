import 'package:flutter/material.dart';
import 'package:flutter_office_booking/views/screens/message_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: Material(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          elevation: 3,
          child: SafeArea(
            child: Center(
              child: Text(
                'Chat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Stack(
            //   alignment: Alignment.center,
            //   children: [
            // Positioned(
            //   left: 10,
            //   child: IconButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     icon: const Icon(
            //       Icons.arrow_back_ios_new,
            //       size: 25,
            //     ),
            //   ),
            // ),
            //   ],
            // ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return const MessageScreen();
                  }));
                },
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Sejahtera Thamrim',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Text('1 Dec')
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Apakah ada kosong ?'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, i) {
              return const SizedBox(
                height: 12,
              );
            },
            itemCount: 4),
      ),
    );
  }
}
