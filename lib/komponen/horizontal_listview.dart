import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Kategori(
              image_location: 'images/cats/smartphone.png',
              image_caption: 'gadget',
          ),
          Kategori(
              image_location: 'images/cats/tablets.png',
              image_caption: 'tablets',
          ),
          Kategori(
              image_location: 'images/cats/wearable.png',
              image_caption: 'wearable',
          ),
          Kategori(
              image_location: 'images/cats/elektronik.png',
              image_caption: 'electronic',
          ),
        ],
      ),
    );
  }
}

class Kategori extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Kategori({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 20.0,
              height: 20.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption, style: new TextStyle(fontSize: 12.0),),
            ),
          ),
        ),
      ),
    );
  }
}
