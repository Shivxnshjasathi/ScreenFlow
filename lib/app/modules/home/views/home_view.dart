import 'package:Scooter/app/common/style.dart';
import 'package:Scooter/app/routes/app_pages.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'ScreenFlow',
                      style: GoogleFonts.alata(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.SEARCH_PAGE);
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'WatchList',
                            style: GoogleFonts.alata(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'AboutMe',
                            style: GoogleFonts.alata(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Popular',
                    style: GoogleFonts.alata(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 310,
              child: Center(
                  child: GetBuilder<HomeController>(
                    init: HomeController(),
                    builder: (_) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.nowPlayingMovies.length,
                        itemBuilder: (context, index) => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_MOVIE,

                                        // Get Id Movie
                                        arguments: controller
                                            .nowPlayingMovies[index].id);
                                  },
                                  child: Center(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      shadowColor: Colors.black,
                                      child: Stack(children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: FancyShimmerImage(
                                              imageUrl:
                                                  'https://image.tmdb.org/t/p/w500/${controller.nowPlayingMovies[index].posterPath}',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.1,
                                              height: 300,
                                              boxFit: BoxFit.cover),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      7,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 25.0,
                                                    ),
                                                    Text(
                                                      controller
                                                          .nowPlayingMovies[
                                                              index]
                                                          .title,
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.alata(
                                                          fontSize: 28,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.star,
                                                          color: ratingBintang,
                                                          size: 30,
                                                        ),
                                                        const SizedBox(
                                                          width: 5.0,
                                                        ),
                                                        Text(
                                                          '${controller.nowPlayingMovies[index].voteAverage.toStringAsFixed(1)} / 10 IMDb',
                                                          style:
                                                              GoogleFonts.alata(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        // Calendar icon
                                                        const Icon(
                                                          Icons.calendar_month,
                                                          color: Colors.white,
                                                          size: 30,
                                                        ),
                                                        const SizedBox(
                                                          width: 5.0,
                                                        ),

                                                        Text(
                                                          DateFormat(
                                                                  'dd MMMM yyyy')
                                                              .format(
                                                            DateTime.parse(controller
                                                                .nowPlayingMovies[
                                                                    index]
                                                                .releaseDate
                                                                .toString()),
                                                          ),
                                                          style:
                                                              GoogleFonts.alata(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                                SizedBox()
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Latest Movies',
                    style: GoogleFonts.alata(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (_) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.trendingMoviews.length,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.DETAIL_MOVIE,
                            // Get Id Movie
                            arguments: controller.trendingMoviews[index].id,
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadowColor: Colors.black,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FancyShimmerImage(
                              width: 175,
                              height: 275,
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500/${controller.trendingMoviews[index].posterPath}',
                              boxFit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            controller.trendingMoviews[index].title,
                            style: GoogleFonts.alata(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.star,
                            color: ratingBintang,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${controller.trendingMoviews[index].voteAverage.toStringAsFixed(1)} / 10 IMDb',
                            style: GoogleFonts.alata(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
