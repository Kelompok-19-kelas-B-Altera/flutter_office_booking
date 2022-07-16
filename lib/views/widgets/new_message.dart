import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../services/graphql/gql_document.dart';

class NewMessage extends StatelessWidget {
  const NewMessage({
    Key? key,
    required this.userId,
    required this.idBuilding,
  }) : super(key: key);

  final int userId;
  final int idBuilding;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _messageController = TextEditingController();
    return SizedBox(
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
                      'idUser': userId,
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
    );
  }
}
