import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:library_books/core/data/card_data.dart';
import 'package:library_books/core/presentation/widgets/popOver_button.dart';
import 'package:library_books/helper/color_constants.dart';

class Book {
  final String title;
  final String author;
  final String description;

  Book({required this.title, required this.author, required this.description});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const colorizeColors = [
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.deepOrangeAccent,
    Colors.black,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: blackColor,
        ),
        title: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            ColorizeAnimatedText(
              'Read your choice',
              textStyle: colorizeTextStyle,
              speed: const Duration(milliseconds: 500),
              colors: colorizeColors,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: blackColor,
                  ),
                ),
                Icon(
                  Icons.notifications,
                  color: blackColor,
                ),
              ],
            ),
          )
        ],
        shadowColor: Colors.grey[600],
        backgroundColor: Colors.brown.withOpacity(0.6),
        toolbarHeight: 50,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: authBgGradient),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: images.length,
                options: CarouselOptions(
                  height: 200.0, // Adjust height as needed
                  autoPlay: true,
                  aspectRatio: 16 / 9, // Adjust aspect ratio as needed
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final String image = images[index];
                  final Book book =
                      books[index % books.length]; // To cycle through books
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.stars_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Author: ${book.author}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                book.description,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20, width: 20, child: PopoverPage())
            ],
          ),
        ),
      ),
    );
  }
}
