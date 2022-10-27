import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      // physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2, //number of columns in a grid view
      shrinkWrap: true,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
          ),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 25.0,
                spreadRadius: 1,
                color: Color.fromARGB(255, 235, 235, 235),
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 153, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "-50%",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: "Inter",
                      ),
                    ),
                  ),
                  Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Image.asset(
                    "./assets/images/starbucksgiftcard.png",
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Product Title",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Inter-Medium",
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
