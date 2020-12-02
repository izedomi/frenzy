import 'package:appsocialz/models/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageCarousel extends StatelessWidget {

    final PageController pageController;
    final String title;
    final List<Post> posts;
    
    PageCarousel({this.pageController, this.title, this.posts});


    Widget _buildPostBackgroundImage(BuildContext context, Post post){
        return Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              boxShadow: [
                  BoxShadow(
                    blurRadius: 6.0,
                    color: Colors.black38,
                    offset: Offset(0,2)
                  )
              ],
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage(post.imageUrl),
                fit: BoxFit.cover
              )
            ),
        );
    }

    Widget _buildPostDetails(BuildContext context, Post post){
      return Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            height:110,
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)
                )
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(post.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(post.location,
                      style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.favorite, color: Colors.red, size: 30.0),
                          SizedBox(width: 4.0),
                          Text(post.likes.toString())
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.comment, color: Theme.of(context).primaryColor, size: 30.0),
                          SizedBox(width: 4.0),
                          Text(post.comments.toString())
                        ],
                      )
                    ],
                  ),
                  
                ],
            ),
          ),
      );
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  )
                ),
              ),
              Container(
                height: 300.0,              
                child: PageView.builder(
                    controller: pageController,
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index){
                        Post post = posts[index];
                        return AnimatedBuilder(
                          animation: pageController,
                          builder: (BuildContext context, Widget widget){
                              double value = 1;
                              
                              if(pageController.position.haveDimensions){
                                value = pageController.page - index;
                                value = 1 -(value.abs() * 0.37).clamp(0.0, 1.0);
                                 print("page " + pageController.page.toString());
                                 print("index " + index.toString()); 
                              }  
                                                      
                              return Center(
                                child: SizedBox(
                                  height: Curves.easeInOut.transform(value) * 400, 
                                  child: widget
                                )
                              );
                          },
                          child: Stack(
                          children: <Widget>[
                              _buildPostBackgroundImage(context, post),
                              _buildPostDetails(context, post)                          
                          ],
                      ),
                        );
                    } 
                ),
              )
            ],
        );
    }
}