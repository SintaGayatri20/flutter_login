import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var products_on_the_cart = [
    {
      "name": "SG Fold",
      "picture": "images/product/sgFold.jpg",
      "price": 100,
      "type": "xxx",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "SG Not 10",
      "picture": "images/product/sgNot10.jpg",
      "price": 990,
      "type": "xxxx",
      "color": "Rose Gold",
      "quantity": 2,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: products_on_the_cart[index]["name"],
            cart_prod_picture: products_on_the_cart[index]["picture"],
            cart_prod_price: products_on_the_cart[index]["price"],
            cart_prod_type: products_on_the_cart[index]["type"],
            cart_prod_color: products_on_the_cart[index]["color"],
            //cart_prod_quantity: products_on_the_cart[index]["quantity"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_type;
  final cart_prod_color;
  //final cart_prod_quantity;

  Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_type,
      this.cart_prod_color,
      //this.cart_prod_quantity
      }
    );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        
// ================ LEADING SECTION ================
        leading: new Image.asset(cart_prod_picture, width: 80.0, height: 80.0,),

// ================== TITLE SECTION =================
        title: new Text(cart_prod_name),

// =================== SUBTITLE SECTION =================
        subtitle: new Column(
          children: <Widget>[
            new Row(
//    =============== TYPE OF PRODUCT ============
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Type:"),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_prod_type,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
//     ============== PRODUCT COLOR ==============             
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color:"),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_prod_color,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
             
//    ============= PRODUCT PRICE =================
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_prod_price}", 
                style: TextStyle(
                  fontSize: 15.0, 
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        // trailing: new Column(
        //   children: <Widget>[
        //     new IconButton(
        //       icon: Icon(Icons.arrow_drop_up),
        //       onPressed: (){},
        //     ),
        //     new Text("$cart_prod_quantity"),
        //     new IconButton(
        //       icon: Icon(Icons.arrow_drop_down),
        //       onPressed: (){},
        //     ),
        //   ],
        // ),
      ),
    );

  }
}
