
import 'package:appsocialz/models/user_model.dart';
import 'package:appsocialz/widgets/carousel.dart';
import 'package:appsocialz/widgets/drawer.dart';
import 'package:appsocialz/widgets/profile/profile_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {

  final User user;
  ProfileScreen(this.user);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  PageController _pagePostController;
  PageController _pageFavController;


  @override
  void initState() {
    super.initState();
      _pagePostController = PageController(viewportFraction: 0.6, initialPage: 1);
      _pageFavController = PageController(viewportFraction: 0.6, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipPath(
                     clipper: ProfileClipper(),
                      child: Image(
                      height: 300.0,
                      width: double.infinity,
                      image: AssetImage(widget.user.backgroundImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 50.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () => scaffoldKey.currentState.openDrawer(),
                      child: Icon(Icons.menu, size: 30.0, color: Colors.white)
                    ),   
                  ),
                  Positioned(
                      bottom: 0.0,
                      child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(blurRadius: 6.0, offset: Offset(0,2), color: Colors.black38)
                        ]
                      ),
                      child: ClipOval(
                          child: Image(
                          image: AssetImage(widget.user.profileImageUrl),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12.0,),
              Text(widget.user.name,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold
              )),
              SizedBox(height: 15.0),
              Row(         
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Following",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400
                    ),),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    )
                      )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Followers",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400
                    ),),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    )
                      )
                  ],
                ),
              ],
              ),
              SizedBox(height: 10.0),
              PageCarousel(pageController: _pagePostController, title: "Your Posts", posts: widget.user.posts),
              SizedBox(height: 10.0),
              PageCarousel(pageController: _pageFavController, title: "Favourites", posts: widget.user.favorites)
            ]
          ),
         
        ),
    );
  }
}