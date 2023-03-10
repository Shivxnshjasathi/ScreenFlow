import 'dart:developer';

import 'package:Scooter/app/common/style.dart';
import 'package:Scooter/app/routes/app_pages.dart';
import 'package:Scooter/app/services/cast_services.dart';
import 'package:Scooter/app/services/details_movie_services.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_movie_controller.dart';

// ignore: must_be_immutable
class DetailMovieView extends GetView<DetailMovieController> {
  DetailMovieView({Key? key}) : super(key: key);

  final id = Get.arguments;

  List<Widget> genres = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: MovieDetailsService().fetchMovieDetails(id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(0),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                          color: Colors.white),
                      padding: const EdgeInsets.only(bottom: 10, top: 5),
                      width: double.maxFinite,
                    ),
                  ),
                  expandedHeight: 300,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FancyShimmerImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500/${snapshot.data.backdropPath}',
                      height: 200,
                      width: double.maxFinite,
                      boxFit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                snapshot.data.title,
                                style: GoogleFonts.alata(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Icon(
                              Icons.bookmark_add_outlined,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: ratingBintang,
                              size: 35,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '${snapshot.data.voteAverage.toStringAsFixed(1)} / 10 IMDb',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      // make chips from list of genres
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          // children: snapshot.data.genres
                          //     .map(
                          //       (genre) => Chip(
                          //         label: Text(genre.name),
                          //         backgroundColor: Colors.grey[200],
                          //       ),
                          //     )
                          //     .toList() as List<Widget>,
                          children: [
                            for (var genre in snapshot.data.genres)
                              Chip(
                                label: Text(
                                  '${genre.name}'.toUpperCase(),
                                  style: const TextStyle(
                                      color: Color.fromRGBO(136, 164, 232, 100),
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor:
                                    const Color.fromRGBO(219, 227, 255, 100),
                              ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Length',
                                  style: GoogleFonts.alata(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  controller.convertMinutesToHours(
                                      snapshot.data.runtime),
                                  style: GoogleFonts.alata(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Language',
                                  style: GoogleFonts.alata(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  '${snapshot.data.spokenLanguages[0].name}',
                                  style: GoogleFonts.alata(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Status',
                                  style: GoogleFonts.alata(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  '${snapshot.data.status}',
                                  style: GoogleFonts.alata(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: GoogleFonts.alata(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Text(
                          '${snapshot.data.overview}',
                          style: GoogleFonts.alata(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cast',
                              style: GoogleFonts.alata(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      FutureBuilder(
                        future: CastService().fetchCast(id),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Flexible(
                              fit: FlexFit.loose,
                              child: Container(
                                height: 400,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                ),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.cast.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      Routes.DETAIL_PERSON,
                                                      arguments: snapshot
                                                          .data.cast[index].id);
                                                  log(snapshot
                                                      .data.cast[index].id
                                                      .toString());
                                                },
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  shadowColor: Colors.black,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: FancyShimmerImage(
                                                      imageUrl:
                                                          'https://image.tmdb.org/t/p/w500/${snapshot.data.cast[index].profilePath}',
                                                      width: 150,
                                                      height: 250,
                                                      boxFit: BoxFit.cover,
                                                      errorWidget:
                                                          FancyShimmerImage(
                                                        imageUrl:
                                                            'https://picsum.photos/200/300',
                                                        width: 150,
                                                        height: 250,
                                                        boxFit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: SizedBox(
                                              width: 150,
                                              child: Text(
                                                '${snapshot.data.cast[index].name}',
                                                style: GoogleFonts.alata(
                                                    fontSize: 20, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: SizedBox(
                                              width: 150,
                                              child: Text(
                                                'as ${snapshot.data.cast[index].character}',
                                                style: GoogleFonts.alata(
                                                    fontSize: 20, fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
