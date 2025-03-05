import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homeapp/core/constants/app_images.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<String> images = [
    AppImages.galleryImgOne,
    AppImages.galleryImgTwo,
    AppImages.galleryImgThree,
    AppImages.galleryImgFour,
    AppImages.galleryImgFive,
    AppImages.galleryImgSix,
    AppImages.galleryImgSeven,
    AppImages.galleryImgEight
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: buildImage(images[0]),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: buildImage(images[1]),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: buildImage(images[2]),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: buildImage(images[3]),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: buildImage(images[4]),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: buildImage(images[5]),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: buildImage(images[6]),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: buildImage(images[7]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImage(String imagePath) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ));
  }
}
