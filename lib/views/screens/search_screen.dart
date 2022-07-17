import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../view_models/search_view_model.dart';
import '../../views/widgets/search_failed.dart';
import '../../views/widgets/search_history.dart';
import '../../views/widgets/search_loading.dart';
import '../../views/widgets/search_success.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SearchViewModel>(context, listen: false)
          .changeState(SearchViewState.search);
    });
  }

  @override
  Widget build(BuildContext context) {
    var _searchController = TextEditingController();
    final searchProvider = Provider.of<SearchViewModel>(context);

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
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        searchProvider.changeState(SearchViewState.search);
                      },
                      onFieldSubmitted: (value) {
                        if (value.isNotEmpty) {
                          searchProvider.addSearchHistory(value);
                          searchProvider.searched = value;
                        }
                        searchProvider.retrieveSearchedBuildings(value);
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
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: body(
        searchProvider,
      ),
    );
  }

  Widget body(
    SearchViewModel searchProvider,
  ) {
    final isLoading = searchProvider.state == SearchViewState.loading;
    final isError = searchProvider.state == SearchViewState.error;
    final isSearch = searchProvider.state == SearchViewState.search;

    if (isSearch) {
      return const SearchHistory();
    }

    if (isLoading) {
      return const SearchLoading();
    }
    if (isError) {
      return const SearchFailed();
    }

    return const SearchSuccess();
  }
}
