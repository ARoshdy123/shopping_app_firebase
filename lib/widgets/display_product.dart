import 'package:flutter/material.dart';
import 'package:shopping_app_firebase/consts/url.dart';


class DisplayProducts extends StatelessWidget {
  DisplayProducts({super.key});

  final List<String> productImages = [
    ProductUrl.pImageUrl1,
    ProductUrl.pImageUrl2,
    ProductUrl.pImageUrl3,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/4,
      child: PageView.builder(
        itemCount: productImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.network(productImages[index]),
          );
        },
      ),
    );
  }
}
