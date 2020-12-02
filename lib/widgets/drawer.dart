
import 'package:appsocialz/data/data.dart';
import 'package:appsocialz/screens/home_screen.dart';
import 'package:appsocialz/screens/login_screen.dart';
import 'package:appsocialz/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  Widget _buildNavImage(double height){

      return Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(currentUser.backgroundImageUrl),
            fit: BoxFit.cover
          )
        ),
      );
    }

    Widget _buildImageUserDetail(BuildContext context, ){
      return Positioned(
        bottom: 16.0,
          left: 16.0,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Container(
                height: 60.0,
                width: 60.0,
                margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(blurRadius: 3.0, offset: Offset(0,2), color: Colors.black54)
                  ],
                  border: Border.all(width: 3.0, color: Theme.of(context).primaryColor)
                ),
                child: ClipOval(
                    child: Image(
                    image: AssetImage(currentUser.profileImageUrl),
                    height: 60.0,
                    width: 60.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(currentUser.name, style: 
                TextStyle(
                  color: Colors.white70,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
                )
              )
          ]
        ),
      );
  }


  Widget _buildListTile(Icon icon, String title, Function onTap){
  
    return ListTile(
      leading: icon,
      title: Text(title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      onTap: onTap,
    );
     
  }




  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Drawer(
       child: Column(
         children: <Widget>[
           Stack(
             children: <Widget>[
                _buildNavImage(deviceHeight / 3.0),
                _buildImageUserDetail(context),
             ],
           ),
          _buildListTile(
              Icon(Icons.dashboard), "Home",
              () =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen())     
          )),
          _buildListTile(
              Icon(Icons.comment), "Chats",
              () =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen())     
          )),
          _buildListTile(
              Icon(Icons.location_on), "Map",
              () =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen())     
          )),
          _buildListTile(
              Icon(Icons.account_circle), "Profile",
              () =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProfileScreen(currentUser))     
          )),
          _buildListTile(
              Icon(Icons.settings), "Settings",
              () =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen())     
          )),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildListTile(
                Icon(Icons.directions_run), "Logout",
                () =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen())     
              )),
            ),
          )
          
         ],
       ),
    );
  }
}