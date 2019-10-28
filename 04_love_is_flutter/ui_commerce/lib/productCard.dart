import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final int cardColor;
  final String imgUrl;
  final String title;
  final String previousPrice;
  final String price;

  ProductCard(this.cardColor,this.imgUrl,this.title,this.previousPrice,this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      decoration: BoxDecoration(
        color: Color(cardColor),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(.3),width: 2)
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: (){},
                ),
                Column(
                  children: <Widget>[
                    Text(
                      previousPrice,
                      style: TextStyle(
                        color: Color(0xFFfeb0ba),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.table_chart),
                  onPressed: (){},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}