// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return  CarouselSlider(
//       options:
//           CarouselOptions(height: 200, autoPlay: true, enlargeCenterPage: true),
//       items: controller.breakingNews.map((instance) {
//         return controller.articleNotFound.value
//             ? const Center(
//                 child: Text("Not Found", style: TextStyle(fontSize: 30)))
//             : controller.breakingNews.isEmpty
//                 ? const Center(child: CircularProgressIndicator())
//                 : Builder(builder: (BuildContext context) {
//                     try {
//                       return Banner(
//                         location: BannerLocation.topStart,
//                         message: 'Top Headlines',
//                         child: InkWell(
//                           onTap: () =>
//                               Get.to(() => WebViewNews(newsUrl: instance.url)),
//                           child: Stack(children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.network(
//                                 instance.urlToImage ?? " ",
//                                 fit: BoxFit.fill,
//                                 height: double.infinity,
//                                 width: double.infinity,
//                                 // if the image is null
//                                 errorBuilder: (BuildContext context,
//                                     Object exception, StackTrace? stackTrace) {
//                                   return Card(
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(10)),
//                                     child: const SizedBox(
//                                       height: 200,
//                                       width: double.infinity,
//                                       child: Icon(Icons.broken_image_outlined),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                             Positioned(
//                                 left: 0,
//                                 right: 0,
//                                 bottom: 0,
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       gradient: LinearGradient(
//                                           colors: [
//                                             Colors.black12.withOpacity(0),
//                                             Colors.black
//                                           ],
//                                           begin: Alignment.topCenter,
//                                           end: Alignment.bottomCenter)),
//                                   child: Container(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 5, vertical: 10),
//                                       child: Container(
//                                           margin: const EdgeInsets.symmetric(
//                                               horizontal: 10),
//                                           child: Text(
//                                             instance.title,
//                                             style: const TextStyle(
//                                                 fontSize: Sizes.dimen_16,
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold),
//                                           ))),
//                                 )),
//                           ]),
//                         ),
//                       );
//                     } catch (e) {
//                       if (kDebugMode) {
//                         print(e);
//                       }
//                       return Container();
//                     }
//                   });
//       }).toList(),
//     );
//     ;
//   }
// }
