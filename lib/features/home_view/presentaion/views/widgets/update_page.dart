import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/core/gaps.dart';
import 'package:storeapp/features/home_view/presentaion/views/widgets/custom_button.dart';
import 'package:storeapp/models/product_model.dart';

import '../../../../../core/services/update_product.dart';
import 'custom_text_field.dart';

class UpDatePage extends StatefulWidget {
  const UpDatePage({Key? key}) : super(key: key);

  @override
  State<UpDatePage> createState() => _UpDatePageState();
}

class _UpDatePageState extends State<UpDatePage> {
  String? productName, desc, image;
  num? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('update page'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 22),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
            child: Column(
              children: [
                Gaps.vGap10,
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                Gaps.vGap10,
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'description',
                ),
                Gaps.vGap10,
                CustomTextField(
                  onChanged: (data) {
                    price = data as num?;
                  },
                  hintText: 'price',
                  inputType: TextInputType.number,
                ),
                Gaps.vGap10,
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'image',
                ),
                Gaps.vGap40,
                CustomButton(
                  title: "Update",
                  functionClick: () async {
                    isLoading = true;
                    print("loading");
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print(product.id!);
                      print("success");
                    } catch (e) {
                      print(e.toString());
                      isLoading = false;
                      setState(() {});
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductServices().updateProduct(
        id: product.id!,
        title: productName == null ? product.title.toString() : productName!,
        price: price == null ? product.price! : price!,
        category: product.category!,
        image: image == null ? product.image.toString() : image!,
        description: desc == null ? product.description.toString() : desc!);
  }
}
