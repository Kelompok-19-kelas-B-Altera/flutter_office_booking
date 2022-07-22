import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../view_models/auth_view_model.dart';
import '../../view_models/detail_view_model.dart';
import '../../view_models/review_view_model.dart';

class WriteReviewBottomSheet extends StatefulWidget {
  const WriteReviewBottomSheet({
    Key? key,
    required this.buildingId,
    required this.queryMedia,
  }) : super(key: key);

  final int buildingId;
  final MediaQueryData queryMedia;

  @override
  State<WriteReviewBottomSheet> createState() => _WriteReviewBottomSheetState();
}

class _WriteReviewBottomSheetState extends State<WriteReviewBottomSheet> {
  bool reviewDone = false;
  bool reviewSuccess = true;
  int ratingStar = 5;

  final _reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    reviewDone = false;
    ratingStar = 5;
  }

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewViewModel>(context);
    final detailProvider = Provider.of<DetailViewModel>(context);
    final authProvider = Provider.of<AuthViewModel>(context);
    return reviewDone
        ? reviewSuccess
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/done.svg',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Review Selesai',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120),
                    child: Text(
                      'Terima kasih atas ulasan yang anda berikan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/failed.svg',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Review Gagal',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120),
                    child: Text(
                      'Ada sudah memeberikan ulasan sebelumnya ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Tulis Review',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                color: Colors.grey[300],
                height: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  detailProvider.detailBuilding.buildingName!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '${detailProvider.detailBuilding.address!}, ${detailProvider.detailBuilding.complex!.city}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ratingStar = 1;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/svg/star.svg',
                        color: ratingStar > 0 ? Colors.yellow : Colors.grey,
                        width: widget.queryMedia.size.width * 0.15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ratingStar = 2;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/svg/star.svg',
                        color: ratingStar > 1 ? Colors.yellow : Colors.grey,
                        width: widget.queryMedia.size.width * 0.15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ratingStar = 3;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/svg/star.svg',
                        color: ratingStar > 2 ? Colors.yellow : Colors.grey,
                        width: widget.queryMedia.size.width * 0.15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ratingStar = 4;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/svg/star.svg',
                        color: ratingStar > 3 ? Colors.yellow : Colors.grey,
                        width: widget.queryMedia.size.width * 0.15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ratingStar = 5;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/svg/star.svg',
                        color: ratingStar > 4 ? Colors.yellow : Colors.grey,
                        width: widget.queryMedia.size.width * 0.15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                color: Colors.grey[300],
                height: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Ceritakan pengalaman terbaikmu',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _reviewController,
                  maxLines: 5,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText:
                        'Airnya bersih, tempatnya tertata rapi, dan enak banget stafnya jg ramah, tempatnya luas, dan juga pas pesen aplikasinya juga fast respon.',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () async {
                    var response = await reviewProvider.addReview(
                      token: authProvider.token!,
                      idUser: authProvider.userData!.id,
                      idBuilding: widget.buildingId,
                      rating: ratingStar,
                      review: _reviewController.text,
                    );
                    if (response != null) {
                      setState(() {
                        detailProvider.getBuildingById(widget.buildingId);
                        reviewDone = true;
                        reviewSuccess = true;
                      });
                    } else {
                      setState(() {
                        reviewDone = true;
                        reviewSuccess = false;
                      });
                    }
                  },
                  child: const Text('Kirim'),
                ),
              ),
            ],
          );
  }
}
