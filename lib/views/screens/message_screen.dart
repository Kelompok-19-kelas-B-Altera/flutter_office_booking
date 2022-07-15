import 'package:flutter/material.dart';

import 'package:flutter_office_booking/services/graphql/gql_document.dart';
import 'package:flutter_office_booking/models/message_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../view_models/auth_view_model.dart';

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
    TextEditingController _messageController = TextEditingController();

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

                    List<GetAllChatByUsersIdAndBuildingId> message = [];

                    if (result.data != null) {
                      MessageModel response =
                          MessageModel.fromJson(result.data!);
                      message = response.getAllChatByUsersIdAndBuildingId!;
                    }

                    DateFormat stringDate = DateFormat("dd-MM-yyyy HH:mm:ss");

                    return GroupedListView<GetAllChatByUsersIdAndBuildingId,
                        DateTime>(
                      elements: message,
                      physics: const BouncingScrollPhysics(),
                      useStickyGroupSeparators: true,
                      floatingHeader: true,
                      order: GroupedListOrder.DESC,
                      reverse: true,
                      groupBy: (message) {
                        return DateTime(
                          stringDate.parse(message.date!).year,
                          stringDate.parse(message.date!).month,
                          stringDate.parse(message.date!).day,
                        );
                      },
                      groupHeaderBuilder:
                          (GetAllChatByUsersIdAndBuildingId message) {
                        return SizedBox(
                          height: 40,
                          child: Center(
                            child: Card(
                              elevation: 8,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  stringDate.parse(message.date!).day ==
                                              DateTime.now().day &&
                                          stringDate
                                                  .parse(message.date!)
                                                  .month ==
                                              DateTime.now().month &&
                                          stringDate
                                                  .parse(message.date!)
                                                  .year ==
                                              DateTime.now().year
                                      ? 'Hari ini'
                                      : DateFormat.yMMMMd().format(
                                          stringDate.parse(message.date!),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemBuilder:
                          (ctx, GetAllChatByUsersIdAndBuildingId message) {
                        return Align(
                          alignment: message.sender!.id ==
                                  authProvider.userData!.id.toString()
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: message.sender!.id ==
                                      authProvider.userData!.id.toString()
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
                            color: message.sender!.id ==
                                    authProvider.userData!.id.toString()
                                ? const Color.fromARGB(255, 25, 123, 235)
                                : Colors.white,
                            elevation: 8,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width - 60,
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                message.message!,
                                style: TextStyle(
                                  color: message.sender!.id ==
                                          authProvider.userData!.id.toString()
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 70,
              child: TextFormField(
                controller: _messageController,
                onFieldSubmitted: (value) {},
                decoration: InputDecoration(
                  hintText: 'Ketik sesuatu ...',
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Mutation(
                      options: MutationOptions(
                        document: gql(sendMessage),
                        update: (cache, result) {},
                        onCompleted: (dynamic resultData) {},
                      ),
                      builder: (RunMutation runMutation, result) {
                        return InkWell(
                          onTap: () {
                            runMutation({
                              'idUser': authProvider.userData!.id,
                              'idBuilding': idBuilding,
                              'message': _messageController.text
                            });
                            _messageController.clear();
                          },
                          child: SvgPicture.asset('assets/svg/send.svg'),
                        );
                      },
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
