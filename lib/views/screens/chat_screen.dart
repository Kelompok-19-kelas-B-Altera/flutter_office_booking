import 'package:flutter/material.dart';
import 'package:flutter_office_booking/models/chat_room_model.dart';
import 'package:flutter_office_booking/services/graphql/gql_document.dart';
import 'package:flutter_office_booking/view_models/auth_view_model.dart';
import 'package:flutter_office_booking/views/screens/message_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context);
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
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Query(
            options: QueryOptions(
              document: gql(getChatRoom),
              variables: {
                'idUser': authProvider.userData!.id,
              },
              fetchPolicy: FetchPolicy.networkOnly,
              pollInterval: const Duration(seconds: 1),
            ),
            builder: (
              QueryResult result, {
              VoidCallback? refetch,
              FetchMore? fetchMore,
            }) {
              if (result.hasException) {
                return const Center(
                  child: Text(
                    'Gagal Memuat Data',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }

              if (result.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              List<GetAllChatroomByUsersIdContaining> chatRoom = [];

              if (result.data != null) {
                ChatRoomModel response = ChatRoomModel.fromJson(result.data!);
                chatRoom = response.getAllChatroomByUsersIdContaining!;
              }

              reFormateDate(String date) {
                DateFormat stringDate = DateFormat("dd-MM-yyyy HH:mm:ss");

                String formatedDate = DateFormat.MMMd().format(
                  stringDate.parse(date),
                );

                return formatedDate;
              }

              print(chatRoom.length);
              return ListView.separated(
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) {
                          return MessageScreen(
                            idUser: authProvider.userData!.id,
                            idBuilding: int.parse(chatRoom[i].building!.id!),
                            alamat: chatRoom[i].building!.address ?? '',
                            imgUrl: chatRoom[i].building!.image!,
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
                              image: chatRoom[i].building!.image !=
                                      'Image Not Found'
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
                                      reFormateDate(
                                          chatRoom[1].lastChat!.date!),
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
            }),
      ),
    );
  }
}
