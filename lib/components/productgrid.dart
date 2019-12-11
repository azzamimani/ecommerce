import 'package:ecommerce/pages/productdetails.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var productList = [
    {
      "name": "24th Single",
      "picture": "images/products/24thsingle.jpg",
      "oldPrice": 32,
      "price": 27
    },
    {
      "name": "4th Album",
      "picture": "images/products/4thalbum.jpg",
      "oldPrice": 47,
      "price": 40
    },
    {
      "name": "Sing Out!",
      "picture": "images/products/singout.jpg",
      "oldPrice": 30,
      "price": 24
    },
    {
      "name": "Mouse Laptop",
      "picture": "images/products/mouse2.jpg",
      "oldPrice": 780,
      "price": 675
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ), itemBuilder: (BuildContext context, int index) {
        return SingleProduct(
          prodName: productList[index]['name'],
          prodPicture: productList[index]['picture'],
          prodOldPrice: productList[index]['oldPrice'],
          prodPrice: productList[index]['price'],
        );
      },);
  }
}

class SingleProduct extends StatelessWidget {
  final prodName, prodPicture, prodOldPrice, prodPrice;
  SingleProduct(
      {this.prodName, this.prodPicture, this.prodOldPrice, this.prodPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prodName,
        child: Material(
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context){
                  return ProductDetails(
                    prodDetailName: prodName,
                    prodDetailPicture: prodPicture,
                    prodDetailOldPrice: prodOldPrice,
                    prodDetailNewPrice: prodPrice,
                  );
                }
                ));
            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text("$prodName", style: TextStyle(fontWeight: FontWeight.bold)),
                  title: Text("\$$prodPrice", style: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold)),
                  subtitle: Text("\$$prodOldPrice", style: TextStyle(color: Colors.black54, decoration: TextDecoration.lineThrough)),
                ),
              ),
              child: Image.asset(prodPicture,
              fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}
