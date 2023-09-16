import 'package:flutter/material.dart';
import 'package:storeapp/core/services/all_products_services.dart';
import 'package:storeapp/models/product_model.dart';
import '../../../../../constant.dart';
import '../../../../../core/styles.dart';
import 'card_container.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorWhite,
      appBar: AppBar(
        backgroundColor: kPrimaryColorWhite,
        elevation: 0,
        title: Center(
            child: Text(
          'All Items',
          style: Styles.textStyle20.copyWith(color: kPrimaryColorBlack),
        )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.card_travel,
                color: kLightGrayColor4,
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:

              FutureBuilder<List<ProductModel>>(
            future: AllProductsSevices().getAllProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return
                  GridView.builder(
                  itemCount: products.length-2,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100),
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    return CardContainer(
                      product: products[index],
                    );
                  },
                );
              } else {
                return Center(
                    child: Text(
                  snapshot.error.toString(),
                  style: const TextStyle(color: Colors.black),
                ));
              }
            },
          ),
      ),
    );
  }
}
