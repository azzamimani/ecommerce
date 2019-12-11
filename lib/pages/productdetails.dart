import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final prodDetailName;
  final prodDetailPicture;
  final prodDetailOldPrice;
  final prodDetailNewPrice;

  ProductDetails(
      {this.prodDetailName,
      this.prodDetailPicture,
      this.prodDetailOldPrice,
      this.prodDetailNewPrice});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        title: Text("Product Details"),
        backgroundColor: Colors.deepPurpleAccent[700],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 350,
            child: Hero(
              tag: new Text('nogizaka'),
              child: GridTile(
                  child: Container(
                      color: Colors.white,
                      child: Image.asset(
                        widget.prodDetailPicture,
                        fit: BoxFit.cover,
                      )),
                  footer: new Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(widget.prodDetailName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      title: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "\$${widget.prodDetailOldPrice}",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "\$${widget.prodDetailNewPrice}",
                              style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: Text("Type"),
                            content: Text("Choose a type you want.."),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Type"),
                      ),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: Text("Quantity"),
                            content: Text("Insert the Quantity"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Qty"),
                      ),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border, color: Colors.red),
              )
            ],
          ),
          Container(
            child: MaterialButton(
              onPressed: () {},
              child: Text("BUY NOW"),
              color: Colors.red,
              textColor: Colors.white,
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Product Details", style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(
                "Informasi dapat di definisikan sebagai hasil dari pengolahan data dalam suatu bentuk yang lebih berguna dan lebih berarti bagi penerimanya yang menggambarkan suatu kejadian-kejadian (event) yang nyata (fact) yang digunakan untuk pengambilan keputusan. Sumber dari informasi adalah data.Data merupakan bentuk jamak dari bentuk tunggal atau data.Data adalah kenyataan yang menggambarkan suatu kejadian-kejadian dan kesatuan nyata.Kejadian-kejadian (event) adalah sesuatu yang terjadi pada saat tertentu."),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Product Name: "),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(widget.prodDetailName),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Licensed by: "),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Nogizaka46, SonyMusic, LLC"),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Condition: "),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("New"),
              )
            ],
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(15),
            child: Text("Similiar Products")
            ),
          Container(
            height: 350,
            child: SimiliarProduct(),
          )
        ],
      ),
    );
  }
}

class SimiliarProduct extends StatefulWidget {
  @override
  _SimiliarProductState createState() => _SimiliarProductState();
}

class _SimiliarProductState extends State<SimiliarProduct> {

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
        return SimiliarSingleProduct(
          prodName: productList[index]['name'],
          prodPicture: productList[index]['picture'],
          prodOldPrice: productList[index]['oldPrice'],
          prodPrice: productList[index]['price'],
        );
      },);
  }
}

class SimiliarSingleProduct extends StatelessWidget {
  final prodName, prodPicture, prodOldPrice, prodPrice;
  SimiliarSingleProduct(
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
