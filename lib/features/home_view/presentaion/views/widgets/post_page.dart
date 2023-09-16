import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/core/gaps.dart';
import 'package:storeapp/features/home_view/presentaion/views/widgets/custom_button.dart';
import 'package:storeapp/models/product_model.dart';
import '../../../../../core/services/post_products.dart';
import 'custom_text_field.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
          title: const Text('Post page'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 22),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Gaps.vGap5,
              CustomTextField(
             onChanged: (data)
                {
                  productName = data;
                },
                obscureText: false,
                hintText: "Product Name ",
                inputType: TextInputType.text,
              ),
              Gaps.vGap5,
              CustomTextField(
                onChanged: (data) {
                  desc = data;
                },
                hintText: "description ",
                obscureText: false,
                inputType: TextInputType.text,
              ),
              Gaps.vGap5,
              CustomTextField(
                onChanged: (data) {
                  price = data as num;
                },
                hintText: "price ",
                obscureText: false,
                inputType: TextInputType.number,
              ),
              Gaps.vGap5,
              CustomTextField(
                onChanged: (data) {
                  image = data;
                },
                hintText: "image",
                obscureText: false,
                inputType:  TextInputType.text,
              ),
              Gaps.vGap40,
              CustomButton(
                title: "Post",
                functionClick: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    postProduct(product);

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
    );
  }
  Future<void> postProduct(ProductModel product) async {
    await PostDataProductServices().postProduct(
        id: product.id!,
        title: productName == null ? product.title.toString() : productName!,
        price: price == null ? product.price! : price!,
        category: product.category!,
        image: image == null ? product.image.toString() : image!,
        description: desc == null ? product.description.toString() : desc!

    );
  }
}
