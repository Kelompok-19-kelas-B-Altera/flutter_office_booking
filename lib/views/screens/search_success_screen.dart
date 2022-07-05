import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchSuccessScreen extends StatelessWidget {
  const SearchSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: Material(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            elevation: 2,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
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
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        textInputAction: TextInputAction.search,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          prefixIconConstraints: const BoxConstraints(),
                          hintText: 'Cari tempat atau lokasi...',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/svg/search.svg'),
                          ),
                          isDense: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Text('data'));
  }
}
