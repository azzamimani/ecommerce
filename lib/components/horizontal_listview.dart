import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'images/cats/accessories.png',
            imageCaption: "Accessories",
          ),
          Category(
            imageLocation: 'images/cats/dress.png',
            imageCaption: "Dress",
          ),
          Category(
            imageLocation: 'images/cats/formal.png',
            imageCaption: "Formal",
          ),
          Category(
            imageLocation: 'images/cats/informal.png',
            imageCaption: "Informal",
          ),
          Category(
            imageLocation: 'images/cats/jeans.png',
            imageCaption: "Jeans",
          ),
          Category(
            imageLocation: 'images/cats/shoe.png',
            imageCaption: "Shoes",
          ),
          Category(
            imageLocation: 'images/cats/tshirt.png',
            imageCaption: "T-Shirt",
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation, imageCaption;
  Category({this.imageLocation, this.imageCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        child: Container(
          width: 100,
          child: ListTile(
              title: Image.asset(imageLocation, width: 100, height: 80),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(imageCaption)
                )
                ),
        ),
      ),
    );
  }
}
