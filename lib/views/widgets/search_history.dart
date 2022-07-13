import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/search_view_model.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchViewModel>(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'Terakhir dicari',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, i) {
                return InkWell(
                  onTap: () {
                    searchProvider.searched = searchProvider.searchHistory[i];
                    searchProvider.retrieveSearchedBuildings(
                        searchProvider.searchHistory[i]);
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.schedule,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              searchProvider.searchHistory[i],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            IconButton(
                              onPressed: () {
                                searchProvider.deleteSearchHistory(i);
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey[300],
                        height: 3,
                      )
                    ],
                  ),
                );
              },
              itemCount: searchProvider.searchHistory.length)
        ],
      ),
    );
  }
}
