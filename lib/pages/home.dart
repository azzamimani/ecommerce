import 'package:ecommerce/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

// my import
import 'package:ecommerce/components/horizontal_listview.dart';
import 'package:ecommerce/components/productgrid.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageSlide = new Container(
      height: 250,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/4thalbum.jpg"),
          AssetImage("images/6th.jpg"),
          AssetImage("images/mouse.jpg"),
          AssetImage("images/nogifes.png"),
          AssetImage("images/otome.jpg"),
          AssetImage("images/yoake.jpg"),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4,
        indicatorBgPadding: 3,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        title: Text("e-Commerce App"),
        backgroundColor: Colors.deepPurpleAccent[700],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => new ShoppingCart()));
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurpleAccent[700]),
              currentAccountPicture: GestureDetector(
                onTap: null,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  child: Text("M"),
                ),
              ),
              accountName: Text("Mizuki"),
              accountEmail: Text("mizuki@nogizaka46.com"),
            ),
            InkWell(
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.deepPurpleAccent[700]),
                title: Text("Home Page"),
              ),
            ),
            InkWell(
              child: ListTile(
                leading:
                    Icon(Icons.person, color: Colors.deepPurpleAccent[700]),
                title: Text("My Account"),
              ),
            ),
            InkWell(
              child: ListTile(
                leading: Icon(Icons.shopping_basket,
                    color: Colors.deepPurpleAccent[700]),
                title: Text("My Order"),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => new ShoppingCart()));
              },
              child: ListTile(
                leading: Icon(Icons.shopping_cart,
                    color: Colors.deepPurpleAccent[700]),
                title: Text("Shopping Cart"),
              ),
            ),
            InkWell(
              child: ListTile(
                leading:
                    Icon(Icons.favorite, color: Colors.deepPurpleAccent[700]),
                title: Text("Favourites"),
              ),
            ),
            Divider(),
            InkWell(
              child: ListTile(
                leading: Icon(Icons.settings, color: Colors.grey[700]),
                title: Text("Settings"),
              ),
            ),
            InkWell(
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.red[700]),
                title: Text("About"),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          imageSlide,
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Categories"),
          ),
          HorizontalListView(),
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Recent Product"),
          ),
          Container(
            height: 350,
            child: Product(),
          )
        ],
      ),
    );
  }
}
