import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../view_models/detail_view_model.dart';
import '../../view_models/search_view_model.dart';
import '../../views/screens/detail_screen.dart';

class SearchSuccess extends StatelessWidget {
  const SearchSuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchViewModel>(context);
    final detailProvider = Provider.of<DetailViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  searchProvider.filterBuilding('Reset');
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12, left: 20),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(120)),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.restart_alt,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Reset',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  searchProvider.filterBuilding('Jakarta Pusat');
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: searchProvider.listFilter.contains('Jakarta Pusat')
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(120)),
                  child: const Center(
                    child: Text(
                      'Jakarta Pusat',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  searchProvider.filterBuilding('Jakarta Barat');
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: searchProvider.listFilter.contains('Jakarta Barat')
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(120)),
                  child: const Center(
                    child: Text(
                      'Jakarta Barat',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  searchProvider.filterBuilding('Jakarta Timur');
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: searchProvider.listFilter.contains('Jakarta Timur')
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(120)),
                  child: const Center(
                    child: Text(
                      'Jakarta Timur',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  searchProvider.filterBuilding('Jakarta Selatan');
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color:
                          searchProvider.listFilter.contains('Jakarta Selatan')
                              ? Colors.blue
                              : Colors.grey[300],
                      borderRadius: BorderRadius.circular(120)),
                  child: const Center(
                    child: Text(
                      'Jakarta Selatan',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  searchProvider.filterBuilding('Jakarta Utara');
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: searchProvider.listFilter.contains('Jakarta Utara')
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(120)),
                  child: const Center(
                    child: Text(
                      'Jakarta Utara',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            '${searchProvider.filteredSearchBuilding.length} Tempat kantor yang tersedia',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: searchProvider
                                  .filteredSearchBuilding[i].images!.isEmpty
                              ? Image.asset(
                                  'assets/images/default_building.png',
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  searchProvider.filteredSearchBuilding[i]
                                      .images![0].imageUrl!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          searchProvider
                              .filteredSearchBuilding[i].buildingName!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/pin.svg',
                              height: 12,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              '${searchProvider.filteredSearchBuilding[i].address!}, ${searchProvider.filteredSearchBuilding[i].complex!.city}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(7, 7, 35, 0.5),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await detailProvider.getBuildingById(
                                searchProvider.filteredSearchBuilding[i].id!);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => DetailScreen(
                                  buildingId: searchProvider
                                      .filteredSearchBuilding[i].id!,
                                ),
                              ),
                            );
                          },
                          child: const Text('Lihat Detail'),
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 40)),
                        )
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        color: Colors.white.withOpacity(0.7),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              searchProvider.review(searchProvider
                                          .filteredSearchBuilding[i]
                                          .reviews!) !=
                                      0
                                  ? searchProvider
                                      .review(searchProvider
                                          .filteredSearchBuilding[i].reviews!)
                                      .toStringAsFixed(1)
                                  : '-',
                              style: const TextStyle(
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: searchProvider.filteredSearchBuilding.length,
          ),
        ),
      ],
    );
  }
}
