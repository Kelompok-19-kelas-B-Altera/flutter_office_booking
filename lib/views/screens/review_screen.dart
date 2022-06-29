import 'package:flutter/material.dart';
import 'package:flutter_office_booking/view_models/auth_view_model.dart';
import 'package:flutter_office_booking/views/screens/detail_screen.dart';
import 'package:flutter_office_booking/views/widgets/write_review_bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final queryMedia = MediaQuery.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: Material(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          elevation: 3,
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Center(
                  child: Text(
                    'Review',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          '-',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          ' / 5',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text(
                          '0',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          ' rating',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/star.svg',
                          height: 35,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          'assets/svg/star.svg',
                          height: 35,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          'assets/svg/star.svg',
                          height: 35,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          'assets/svg/star.svg',
                          height: 35,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          'assets/svg/star.svg',
                          height: 35,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '5',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: queryMedia.size.width * 0.3,
                          child: const LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.yellow),
                            value: 0.4,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('0'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '4',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: queryMedia.size.width * 0.3,
                          child: const LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.yellow),
                            value: 0.4,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('0'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '3',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: queryMedia.size.width * 0.3,
                          child: const LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.yellow),
                            value: 0.4,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('0'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '2',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: queryMedia.size.width * 0.3,
                          child: const LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.yellow),
                            value: 0.4,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('0'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '1',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: queryMedia.size.width * 0.3,
                          child: const LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.yellow),
                            value: 0.4,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('0'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            color: Colors.grey[300],
            height: 5,
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Tulis Review',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Ceritakan pengalaman terbaikmu',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                IconButton(
                  onPressed: authViewModel.token != null
                      ? () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              isScrollControlled: true,
                              elevation: 10,
                              context: context,
                              builder: (ctx) {
                                return SingleChildScrollView(
                                  child: SizedBox(
                                    height: queryMedia.size.height * 0.9,
                                    child: WriteReviewBottomSheet(
                                        queryMedia: queryMedia),
                                  ),
                                );
                              });
                        }
                      : null,
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            color: Colors.grey[300],
            height: 5,
          ),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Review',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Flexible(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundImage:
                                  AssetImage('assets/images/circle.png'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Tinda Jodri',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            SvgPicture.asset(
                              'assets/svg/star.svg',
                              color: Colors.yellow,
                              height: 15,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            SvgPicture.asset(
                              'assets/svg/star.svg',
                              color: Colors.yellow,
                              height: 15,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            SvgPicture.asset(
                              'assets/svg/star.svg',
                              color: Colors.yellow,
                              height: 15,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            SvgPicture.asset(
                              'assets/svg/star.svg',
                              color: Colors.yellow,
                              height: 15,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            SvgPicture.asset(
                              'assets/svg/star.svg',
                              color: Colors.yellow,
                              height: 15,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text('1 jam yang lalu')
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            'Keren tempatnya bersih ga nyesel pokoknyaKeren tempatnya bersih ga nyesel pokoknyaKeren tempatnya bersih ga nyesel pokoknya')
                      ],
                    ),
                  );
                },
                separatorBuilder: (ctx, i) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    color: Colors.grey[300],
                    height: 5,
                  );
                },
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
