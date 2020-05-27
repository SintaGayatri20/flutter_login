import 'package:flutter/material.dart';

//own import
import 'package:samsungstore/komponen/horizontal_listview.dart';
import 'package:samsungstore/komponen/products.dart';
import 'package:samsungstore/pages/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'dart:async';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  signOut() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      preferences.setInt('level',3);
    });
    Navigator.pushReplacementNamed(context, '/pages/login');
  }

  @override
  Widget build(BuildContext context) {
    Widget Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.black,
        title: Text('SAMSUNG STORE'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //HEADER//
            new UserAccountsDrawerHeader(
              accountName: Text('Sinta Gayatri'),
              accountEmail: Text('sinta@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.black),
            ),

            //BODY//
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.black,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
              },
              child: ListTile(
                title: Text('Shopping cart'),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favorietes'),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {
                signOut();
              },
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(
                  Icons.backspace,
                  color: Colors.black,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      body: new Column(
        children: <Widget>[

          //PADDING WIDGET
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text('Categories')),
          ),

          //HORIZONTAL LIAST VIEW
          HorizontalList(),

          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text('Recent products'),
            ),
          ),

          //GRID VIEW
          Flexible(
            child: Products(),
          )
        ],
      ),
    );
  }
}
