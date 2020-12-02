
import 'package:appsocialz/widgets/drawer.dart';
import 'package:appsocialz/widgets/homescreen/trending.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          title: Text(
            "FRENZY", 
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              letterSpacing: 10.0
            ),
            ),
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            labelStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
            unselectedLabelColor: Colors.blue[600],
            unselectedLabelStyle: TextStyle(
              fontSize: 18.0
            ),
            indicatorColor: Theme.of(context).primaryColor,
            indicatorWeight: 3.0,
            tabs: <Widget>[
              Tab(text: "Trending"),
              Tab(text: "Latest")
            ],
          )
        ),
        drawer: CustomDrawer(),
        body: TabBarView(
          children: <Widget>[
             Trending(),
             Center(child: Text("Latest"))
          ],
        ),
      ),
    );
  }
}