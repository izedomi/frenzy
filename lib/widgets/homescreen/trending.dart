import 'package:appsocialz/data/data.dart';
import 'package:flutter/material.dart';

import '../carousel.dart';
import 'following.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}


class _TrendingState extends State<Trending> {

  PageController _pageController;

  @override
  void initState() {
    
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);

  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Following(),
        PageCarousel(pageController: _pageController, title: "Posts", posts: posts)
      ],
    );
  }
}