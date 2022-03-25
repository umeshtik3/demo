import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHorizontalList extends StatelessWidget {
  const MyHorizontalList(
      {Key? key,
      this.courseHeadline,
      this.courseTitle,
      this.courseImage,
      required this.startColor,
      required this.endColor})
      : super(key: key);
  final String? courseHeadline, courseTitle, courseImage;
  final int startColor, endColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26),
      child: Container(
        width: 246,
        height: 349,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: const Alignment(1, 0),
                colors: <Color>[Color(startColor), Color(endColor)])),
        child: Stack(
          children: [
            Positioned(
                top: 15,
                left: 11,
                child: Container(
                    padding: EdgeInsets.all(10),
                    height: 39,
                    decoration: BoxDecoration(
                        color: const Color(0xFFAFA8EE),
                        borderRadius: BorderRadius.circular(36)),
                    child: Text(
                      courseHeadline ?? '',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ))),
            Positioned(
                top: 80,
                left: 14,
                child: Text(
                  courseTitle ?? '',
                  style: GoogleFonts.roboto(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  courseImage!,
                  scale: 2,
                ))
          ],
        ),
      ),
    );
  }
}
