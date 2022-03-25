import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class MyVerticalList extends StatelessWidget {
  const MyVerticalList(
      {Key? key,
      this.courseTitle,
      this.courseDuration,
      this.courseImage,
      this.courseRating})
      : super(key: key);

  final String? courseTitle, courseDuration, courseImage;
  final double? courseRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: 134,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              width: 310,
              height: 92,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF3E3A6D),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26, bottom: 19),
              child: Row(
                children: [
                  Container(
                    width: 115,
                    height: 115,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage(courseImage!))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(courseTitle ?? '',
                            style: GoogleFonts.roboto(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        Text(courseDuration ?? '',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: const Color(0xFF9C9A9A),
                            )),
                        RatingBar.builder(
                            initialRating: courseRating!,
                            maxRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 18,
                            itemPadding: const EdgeInsets.only(right: 1),
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            },
                            onRatingUpdate: (rating) {
                              // ignore: avoid_print
                              print(rating);
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 34,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.06,
                width: MediaQuery.of(context).size.width * 0.06,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEB53A2),
                ),
                child: const Icon(Icons.play_arrow, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
