import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sizer/sizer.dart';

import '../resources/session_controller/session_controller.dart';

class ImageGalleryWidget extends StatefulWidget {
  final List<String> imageUrls;

  const ImageGalleryWidget({super.key, required this.imageUrls});

  @override
  State<ImageGalleryWidget> createState() => _ImageGalleryWidgetState();
}

class _ImageGalleryWidgetState extends State<ImageGalleryWidget> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    for(var allImages in widget.imageUrls){


    }
    super.initState();
  }


  void showFullImage(BuildContext context, int index) {
    setState(() {
      currentIndex = index;
    });

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.black,
              insetPadding: EdgeInsets.zero,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:"${SessionController.baseURlProductImage}${widget.imageUrls[currentIndex]}" ,
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/2,
                  ),

                  // Close Button
                  Positioned(
                    top: 40,
                    right: 20,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 30),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  // Previous Button
                  if (currentIndex > 0)
                    Positioned(
                      left: 10,
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left, color: Colors.white, size: 50),
                        onPressed: () {
                          setState(() {
                            currentIndex--;
                          });
                        },
                      ),
                    ),

                  // Next Button
                  if (currentIndex < widget.imageUrls.length - 1)
                    Positioned(
                      right: 10,
                      child: IconButton(
                        icon: const Icon(Icons.chevron_right, color: Colors.white, size: 50),
                        onPressed: () {
                          setState(() {
                            currentIndex++;
                          });
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.imageUrls.map((imageUrl) {
          int index = widget.imageUrls.indexOf(imageUrl);
          return GestureDetector(
            onTap: () => showFullImage(context, index),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              child: CachedNetworkImage(
                imageUrl: "${SessionController.baseURlProductImage}$imageUrl",
                height: 6.h,
                width: 6.h,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

}
