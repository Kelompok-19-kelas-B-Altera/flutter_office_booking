import 'package:flutter/material.dart';
import 'package:flutter_office_booking/views/screens/search_success_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _searchController = TextEditingController();
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
                      onFieldSubmitted: (value) {
                        print('a');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchSuccessScreen(),
                          ),
                        );
                      },
                      controller: _searchController,
                      textInputAction: TextInputAction.search,
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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Terakhir dicari',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, i) {
                return ListTile(
                  leading: Icon(Icons.schedule),
                  title: Text('Jakarta Selatan'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
              separatorBuilder: (ctx, i) {
                return Container(
                  color: Colors.grey[300],
                  height: 3,
                );
              },
              itemCount: 4)
        ],
      ),
    );
  }
}
