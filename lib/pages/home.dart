// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Added for animated text

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTyping = false; // Tracks if user is typing
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        isTyping = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchField(),
        ],
      ),
    );
  }

  Column searchField() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color(0xff1D1617).withValues(alpha: 0.11),
                blurRadius: 40,
                spreadRadius: 0.0)
          ]),
          child: Stack(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(15),
                    hintText: '', // Empty hintText to avoid overlapping
                    prefixIcon: SizedBox(
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 12, left: 0, right: 5),
                        child: SvgPicture.asset("assets/icons/Search.svg"),
                      ),
                    ),
                    suffixIcon: SizedBox(
                      width: 75,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            VerticalDivider(
                              color: Colors.black,
                              indent: 10,
                              endIndent: 10,
                              thickness: 0.1,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child:
                                  SvgPicture.asset("assets/icons/Filter.svg"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    )),
              ),
              if (!isTyping)
                Positioned(
                  left: 60, // Adjust to match prefix icon width
                  top: 17, // Centered within the TextField
                  child: SizedBox(
                    width: 250, // Adjust for available space
                    child: DefaultTextStyle(
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      child: Row(
                        children: [
                          Text('Search '), // Static text
                          AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TyperAnimatedText('Cakes'),
                              TyperAnimatedText('Pancakes'),
                              TyperAnimatedText('Salad'),
                              TyperAnimatedText('Pie'),
                              TyperAnimatedText('Smoothie'),
                              TyperAnimatedText('Bread'),
                              TyperAnimatedText('Sushi'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
        title: Text(
          "Breakfast",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              "assets/icons/Arrow_Left.svg",
              height: 20,
              width: 20,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 37,
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                "assets/icons/Detail.svg",
                height: 5,
                width: 5,
              ),
            ),
          ),
        ]);
  }
}
