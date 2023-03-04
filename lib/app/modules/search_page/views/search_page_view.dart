import 'package:Scooter/app/common/style.dart';
import 'package:Scooter/app/routes/app_pages.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search',
                      style: GoogleFonts.alata(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                clipBehavior: Clip.hardEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: TextField(
                                controller: controller.movieName,
                                style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Search',
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              controller.search();
                            },
                            icon: Icon(
                              Icons.search_rounded,
                              size: 30,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<SearchPageController>(
                      init: controller,
                      builder: (_) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: controller.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.amber),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.searchResult.length,
                                  itemBuilder: (context, index) => Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(Routes.DETAIL_MOVIE,

                                                  // Get Id Movie
                                                  arguments: controller
                                                      .searchResult[index].id);
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              shadowColor: Colors.black,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: FancyShimmerImage(
                                                    imageUrl:
                                                        'https://image.tmdb.org/t/p/w500/${controller.searchResult[index].posterPath}',
                                                    width: 200,
                                                    height: 300,
                                                    boxFit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 25.0,
                                                ),
                                                Text(
                                                  controller.searchResult[index]
                                                      .title,
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.alata(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                      '${controller.searchResult[index].voteAverage.toStringAsFixed(1)} / 10 IMDb',
                                                      style: GoogleFonts.alata(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    // Calendar icon
                                                    const Icon(
                                                      Icons.calendar_month,
                                                      color: Colors.grey,
                                                      size: 30,
                                                    ),
                                                    const SizedBox(
                                                      width: 5.0,
                                                    ),

                                                    SizedBox(
                                                      width: 150,
                                                      child: Text(
                                                        DateFormat(
                                                                'dd MMMM yyyy')
                                                            .format(
                                                          DateTime.parse(
                                                              controller
                                                                  .searchResult[
                                                                      index]
                                                                  .releaseDate
                                                                  .toString()),
                                                        ),
                                                        style:
                                                            GoogleFonts.alata(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
