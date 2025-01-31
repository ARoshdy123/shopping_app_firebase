import 'package:flutter/material.dart';
import 'package:shopping_app_firebase/consts/url.dart';

class HotOffers extends StatelessWidget {
  HotOffers({super.key});




  final List<Map<String, String>> offers = [
    {"image": HotOffersUrl.hImagesUrl1, "text": "Offer 1"},
    {"image": HotOffersUrl.hImagesUrl2, "text": "Offer 2"},
    {"image": HotOffersUrl.hImagesUrl3, "text": "Offer 3"},
    {"image": HotOffersUrl.hImagesUrl4, "text": "Offer 4"},
    {"image": HotOffersUrl.hImagesUrl4, "text": "Offer 5"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: ListView.builder(
        itemCount: offers.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Image.network(offers[index]['image']!, height: MediaQuery.sizeOf(context).height/6, width: 200),
                const SizedBox(height: 5),
                Text(offers[index]['text']!),
              ],
            ),
          );
        },
      ),
    );
  }
}
