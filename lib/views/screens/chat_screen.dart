import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../models/chat_room_model.dart';
import '../../services/graphql/gql_document.dart';
import '../../view_models/auth_view_model.dart';
import '../../views/widgets/chat_room_card.dart';

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
              List<GetAllChatroomByUsersIdContaining> chatRoom = [];

              if (result.hasException) {
                return const Center(
                  child: Text(
                    'Gagal Memuat Data',
                    style: TextStyle(
                      fontSize: 20,
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

              if (result.data != null) {
                ChatRoomModel response = ChatRoomModel.fromJson(result.data!);
                chatRoom = response.getAllChatroomByUsersIdContaining!;
              }

              if (chatRoom.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/no_chat.svg',
                        // height: 400,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Tidak ada pesan',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Tulis pesan sekarang dan \nmulailah berinteraksi',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }

              return ChatRoomCard(
                userId: authProvider.userData!.id,
                chatRoom: chatRoom,
              );
            }),
      ),
    );
  }
}
