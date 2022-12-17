import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/shop.dart';
import '../../Shop/bloc/shop_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ShopItem> shopItems;
  List<ShopItem> cartItems = [];
  bool loadingData = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ShopBloc, ShopState>(
      listener: (context, state) {
        if (state is ShopInitial) {
          loadingData = true;
        }
        if (state is ShopPageLoadedState) {
          shopItems = state.shopData.shopitems;
          cartItems = state.cartData.shopitems;
          loadingData = false;
        }
        if (state is ItemDeletingCartState) {
          cartItems = state.cartItems;
        }
      },
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 120.10, //set your height
              flexibleSpace: SafeArea(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Color.fromARGB(255, 255, 255, 255), // set your color
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: Color.fromARGB(255, 255, 153, 0),
                                ),
                              ),
                              Text(
                                "Point Shop",
                                style: TextStyle(
                                  fontFamily: 'Inter-Black',
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 45,
                            height: 45,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.shopping_bag_rounded,
                                size: 30,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color.fromARGB(255, 255, 126, 45),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 15,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.card_giftcard),
                            onPressed: () {},
                            iconSize: 23,
                          ),
                          Text(
                            "420",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Inter-bold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
