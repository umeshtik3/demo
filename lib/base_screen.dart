import 'package:demo/widgets/my_horizontal_list.dart';
import 'package:demo/widgets/my_verical_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Online',
                  style: GoogleFonts.roboto(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text('Master Class ',
                  style: GoogleFonts.roboto(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                height: 349,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return MyHorizontalList(
                      startColor: 0xFF9288E4,
                      endColor: 0xFF534EA7,
                      courseHeadline: 'Recommended',
                      courseTitle: 'UI/UX Designer\nBeginner'.toUpperCase(),
                      courseImage: 'assets/img/img_saly.png',
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              Text('Free Online Class',
                  style: GoogleFonts.roboto(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
              Text('From over 80 lectures',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: const Color(0xFF9C9A9A),
                  )),
              ListView.builder(
                itemCount: 12,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const MyVerticalList(
                    courseTitle: 'Flutter Developer',
                    courseDuration: '8 Hours',
                    courseImage: 'assets/img/img_saly24.png',
                    courseRating: 4,
                  );
                },
              )
            ],
          ),
        ],
      )),
    );
  }
}
