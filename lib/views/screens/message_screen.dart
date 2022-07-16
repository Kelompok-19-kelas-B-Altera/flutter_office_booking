import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import '../../services/graphql/gql_document.dart';
import '../../models/message_model.dart';
import '../../views/widgets/message_list.dart';
import '../../view_models/auth_view_model.dart';
import '../../views/widgets/new_message.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({
    Key? key,
    required this.idUser,
    required this.idBuilding,
    required this.alamat,
    required this.imgUrl,
    required this.buildingName,
  }) : super(key: key);

  final int idUser;
  final int idBuilding;
  final String alamat;
  final String imgUrl;
  final String buildingName;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 225, 225),
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
                      image: DecorationImage(
                        image: NetworkImage(imgUrl),
                        fit: BoxFit.cover,
                      ),
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
                        buildingName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
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
                              alamat,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.grey),
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
              child: Query(
                options: QueryOptions(
                  document: gql(getMessageAtRoomByIdBuilding),
                  variables: {
                    'idBuilding': idBuilding,
                    'idUser': idUser,
                  },
                  fetchPolicy: FetchPolicy.networkOnly,
                  pollInterval: const Duration(seconds: 30),
                ),
                builder: (
                  QueryResult result, {
                  VoidCallback? refetch,
                  FetchMore? fetchMore,
                }) {
                  List<GetAllChatByUsersIdAndBuildingId> message = [];

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

                  if (result.data != null) {
                    MessageModel response = MessageModel.fromJson(result.data!);
                    message = response.getAllChatByUsersIdAndBuildingId!;
                  }

                  return MessageList(
                    userId: authProvider.userData!.id,
                    message: message,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            NewMessage(
              userId: authProvider.userData!.id,
              idBuilding: idBuilding,
            ),
          ],
        ),
      ),
    );
  }
}
