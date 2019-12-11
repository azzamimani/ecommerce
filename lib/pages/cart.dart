import 'package:flutter/material.dart';

//own imports
import 'package:ecommerce/components/cartproducts.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        title: Text("Cart"),
        backgroundColor: Colors.deepPurpleAccent[700],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: new CartProduct(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("Total:", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("\$250", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: (){},
                color: Colors.green,
                child: Text("Check Out", style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}