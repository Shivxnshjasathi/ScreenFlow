import 'package:Scooter/app/services/person_details_service.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../../../common/style.dart';
import '../controllers/detail_person_controller.dart';

class DetailPersonView extends GetView<DetailPersonController> {
  DetailPersonView({Key? key}) : super(key: key);

  final id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: FutureBuilder(
          future: PersonDetailsService().fetchPersonDetails(id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
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
                    expandedHeight: 600,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          snapshot.data.name,
                          style: GoogleFonts.alata(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      background: FancyShimmerImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/original/${snapshot.data.profilePath}',
                        height: 600,
                        width: double.maxFinite,
                        boxFit: BoxFit.cover,
                        errorWidget: FancyShimmerImage(
                          imageUrl:
                              'https://i.pinimg.com/474x/56/51/92/565192fc7848fbb8abd85136497a095b.jpg',
                          width: 150,
                          height: 150,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                    'Age',
                                    style: GoogleFonts.alata(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      controller.convertBirtdayToAge(
                                          snapshot.data.birthday.toString()),
                                      style: GoogleFonts.alata(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gender',
                                      style: GoogleFonts.alata(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        controller.parseJenisKelamin(
                                            snapshot.data.gender.toString()),
                                        style: GoogleFonts.alata(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                                    'Birthday',
                                    style: GoogleFonts.alata(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      DateFormat('dd MMMM yyyy').format(
                                          DateTime.parse(snapshot.data.birthday
                                              .toString())),
                                      style: GoogleFonts.alata(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Born in',
                                    style: GoogleFonts.alata(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      snapshot.data.placeOfBirth.toString(),
                                      style: GoogleFonts.alata(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
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
                                'Biography',
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
                          child: ReadMoreText(
                            '${snapshot.data.biography}',
                            trimLines: 12,
                            colorClickableText: Colors.blue,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: GoogleFonts.alata(
                                fontSize: 20, fontWeight: FontWeight.w500),
                            style:GoogleFonts.alata(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }

            if (ConnectionState.waiting == snapshot.connectionState) {
              return const CircularProgressIndicator(
                color: blueBanget,
              );
            }

            if (snapshot.data == null || snapshot.data.name == null) {
              return EmptyWidget(
                image: null,
                packageImage: PackageImage.Image_1,
                title: 'Not found',
                subTitle: 'Person not found',
                titleTextStyle: const TextStyle(
                  fontSize: 40,
                  color: Color(0xff9da9c7),
                  fontWeight: FontWeight.w500,
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 25,
                  color: Color(0xffabb8d6),
                ),
              );
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
