import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugu/models/products.dart';
import 'package:sugu/screens/details/description.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({super.key});

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _currentIndex = 0;

  final List<Products> products = Products.getProducts();
  @override
  Widget build(BuildContext context) {
    // final firstfree = products.take(3).toList();
    return Column(
      children: [
        CarouselSlider(
          items: products.take(3).map((item) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                          padding: const EdgeInsets.all(15),
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Descriptions(item: item));
                    });
              },
              child: Container(
                height: 200,
                width: 400,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(99, 255, 110, 66),
                  // color: Color.fromARGB(255, 212, 212, 212),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child:
                    ClipRect(child: Image.asset(item.image, fit: BoxFit.fill)),
              ),
            );
          }).toList(),
          options: CarouselOptions(
              height: 200,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ),
        const SizedBox(height: 15),
        Center(
            child: Text("-50% in 3 days",
                style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepOrange[400]))),
        const SizedBox(height: 15),
        DotsIndicator(
          dotsCount: 3,
          position: _currentIndex.toInt(),
          decorator: DotsDecorator(
            size: const Size(12.0, 12.0),
            activeSize: const Size(40.0, 12.0),
            color: Colors.grey[400]!,
            activeColor: Colors.deepOrange[400],
            spacing: const EdgeInsets.all(3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
