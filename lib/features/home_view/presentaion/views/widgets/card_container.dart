import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import '../../../../../core/gaps.dart';
import '../../../../../core/styles.dart';
import '../../../../../models/product_model.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({Key? key, required this.product}) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.pushNamed(context,'/postPage',arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 150,
            width: 180,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(4, 3), // changes position of shadow
                ),
              ],
            ),
            child: Card(
              color: kPrimaryColorWhite,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.title!.substring(0,6),
                      style: Styles.textStyle18.copyWith(color: kLightGrayColor4),
                    ),
                    Gaps.vGap5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text( "\$  ${product.price.toString()}",

                          style: Styles.textStyle20
                              .copyWith(color: kPrimaryColorBlack),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: 60,
              top: -40,
              child: Image.network(
                product.image!,
                height: 100,
              )),
        ],
      ),
    );
  }
}
