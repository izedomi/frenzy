import 'package:appsocialz/data/data.dart';
import 'package:appsocialz/models/user_model.dart';
import 'package:flutter/material.dart';

class Following extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Following",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                )
              ),
            ),
            Container(
              height: 80.0,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index){
                  User user = users[index];
                   return Container(
                     height: 60.0,
                     width: 60.0,
                     margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                     decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(blurRadius: 3.0, offset: Offset(0,2), color: Colors.black54)
                        ],
                        border: Border.all(width: 4.0, color: Theme.of(context).primaryColor)
                     ),
                     child: ClipRRect(
                         borderRadius: BorderRadius.circular(30.0),
                         child: Image(
                         image: AssetImage(user.profileImageUrl),
                         height: 60.0,
                         width: 60.0,
                         fit: BoxFit.cover,
                       ),
                     ),
                   );
                }
              ),
            )
        ],
      );
  }

}