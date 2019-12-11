import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  var productCartList = [
    {
      "name": "24th Single",
      "picture": "images/products/24thsingle.jpg",
      "price": 27,
      "type": "A",
      "quantity": 1
    },
    {
      "name": "Sing Out! Regular",
      "picture": "images/products/singout.jpg",
      "price": 40,
      "type": "R",
      "quantity": 1
    }
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: productCartList.length,
      itemBuilder: (context, index) {
        return SingleCartProduct(
          cartProdName: productCartList[index]["name"],
          cartProdType: productCartList[index]["type"],
          cartProdQuantity: productCartList[index]["quantity"],
          cartProdPrice: productCartList[index]["price"],
          cartProdPicture: productCartList[index]["picture"],
        );
      },
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProdName,
      cartProdPicture,
      cartProdPrice,
      cartProdType,
      cartProdQuantity;
  SingleCartProduct(
      {Key key,
      this.cartProdName,
      this.cartProdPicture,
      this.cartProdPrice,
      this.cartProdType,
      this.cartProdQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          cartProdPicture,
          width: 150,
          height: 150,
          fit: BoxFit.cover
        ),
        title: Text(
          cartProdName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: new Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Type: "),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cartProdType,
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$$cartProdPrice",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            )
          ],
        ),
        trailing: Text("$cartProdQuantity", 
          style: TextStyle(fontSize: 20)
        ),
      ),
    );
  }
}

