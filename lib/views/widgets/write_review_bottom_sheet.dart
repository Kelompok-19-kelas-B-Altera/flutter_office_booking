import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WriteReviewBottomSheet extends StatefulWidget {
  const WriteReviewBottomSheet({
    Key? key,
    required this.queryMedia,
  }) : super(key: key);

  final MediaQueryData queryMedia;

  @override
  State<WriteReviewBottomSheet> createState() => _WriteReviewBottomSheetState();
}

class _WriteReviewBottomSheetState extends State<WriteReviewBottomSheet> {
  bool reviewDone = false;
  int reviewStar = 5;

  final _reviewController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reviewDone = false;
    reviewStar = 5;
  }

  @override
  Widget build(BuildContext context) {
    return reviewDone
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Guardian Office',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Cilandak, Jakarta Selatan',
                  style: TextStyle(
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
                          reviewStar = 1;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/svg/star.svg',
                        color: reviewStar > 0 ? Colors.yellow : Colors.grey,
                        width: widget.queryMedia.size.width * 0.15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          reviewStar = 2;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/svg/star.svg',
                        color: reviewStar > 1 ? Colors.yellow : Colors.grey,
                        width: widget.queryMedia.size.width * 0.15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          reviewStar = 3;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/svg/star.svg',
                        color: reviewStar > 2 ? Colors.yellow : Colors.grey,
                        width: widget.queryMedia.size.width * 0.15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          reviewStar = 4;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/svg/star.svg',
                        color: reviewStar > 3 ? Colors.yellow : Colors.grey,
                        width: widget.queryMedia.size.width * 0.15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          reviewStar = 5;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/svg/star.svg',
                        color: reviewStar > 4 ? Colors.yellow : Colors.grey,
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
                  onPressed: () {
                    setState(() {
                      reviewDone = true;
                    });
                  },
                  child: const Text('Kirim'),
                ),
              ),
            ],
          );
  }
}
