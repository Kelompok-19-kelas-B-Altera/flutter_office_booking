import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/chat_room_model.dart';
import '../../view_models/chat_view_model.dart';
import '../screens/message_screen.dart';

class ChatRoomCard extends StatelessWidget {
  const ChatRoomCard({
    Key? key,
    required this.userId,
    required this.chatRoom,
  }) : super(key: key);

  final int userId;
  final List<GetAllChatroomByUsersIdContaining> chatRoom;

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatViewModel>(context);
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return MessageScreen(
                  idUser: userId,
                  idBuilding: int.parse(chatRoom[i].building!.id!),
                  alamat: chatRoom[i].building!.address ?? ' ',
                  imgUrl: chatRoom[i].building!.image ?? '',
                  buildingName: chatRoom[i].building!.name!,
                );
              }));
            },
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                    image: chatRoom[i].building!.image != 'Image Not Found'
                        ? DecorationImage(
                            image: NetworkImage(
                              chatRoom[i].building!.image!,
                            ),
                            fit: BoxFit.cover,
                          )
                        : const DecorationImage(
                            image: AssetImage(
                              'assets/images/default_building.png',
                            ),
                            fit: BoxFit.cover,
                          ),
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
                          Expanded(
                            child: Text(
                              chatRoom[i].building!.name!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            chatProvider
                                .reFormatDate(chatRoom[i].lastChat!.date!),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(chatRoom[i].lastChat!.message!),
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
        itemCount: chatRoom.length);
  }
}
