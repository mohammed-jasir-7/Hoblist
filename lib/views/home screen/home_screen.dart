import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geeks/controllers/hoblist%20bloc/hoblist_bloc.dart';
import 'package:geeks/views/colors.dart';
import 'package:geeks/views/custom%20style/custom_style.dart';
import 'package:geeks/views/custom%20widgets/custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HoblistBloc>().add(const FetchMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hobsPrimary,
        title: Hero(
          transitionOnUserGestures: false,
          tag: "logo",
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/images/logo.svg",
              width: size.width / 4,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.info_outline,
              color: whiteColor,
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            height15,
            SizedBox(
              height: 200,
              width: size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: BlocBuilder<HoblistBloc, HoblistState>(
                    builder: (context, state) {
                      if (state is ProvideData) {
                        if (state.movieList == null &&
                            state.movieList!.isEmpty) {
                          return Center(
                            child: Lottie.asset('assets/images/nodata.json'),
                          );
                        } else {
                          return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                log("${state.movieList?[index].poster}");
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      image: DecorationImage(
                                        repeat: ImageRepeat.noRepeat,
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            state.movieList?[index].poster ??
                                                "") as ImageProvider,
                                      )),
                                  child: Image.network(
                                      state.movieList?[index].poster ?? ""),
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 20,
                                    height: 50,
                                  ),
                              itemCount: state.movieList!.length);
                        }
                      } else if (state is LoadingState) {
                        return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    color: Colors.amber,
                                    width: 100,
                                    height: 150,
                                    child: Image.network(""),
                                  ));
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 20,
                                  height: 50,
                                ),
                            itemCount: 100);
                      } else if (state is NetWorkState) {
                        return Center(
                            child:
                                Lottie.asset('assets/images/nonetwork.json'));
                      }
                      return Center(
                        child: Lottie.asset('assets/images/wrong.json'),
                      );
                    },
                  )),
                ],
              ),
            ),
            height15,
            Expanded(child: BlocBuilder<HoblistBloc, HoblistState>(
              builder: (context, state) {
                if (state is ProvideData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.arrow_drop_up,
                                          size: 50,
                                        ),
                                        CustomText(content: "0"),
                                        Icon(
                                          Icons.arrow_drop_down_sharp,
                                          size: 50,
                                        ),
                                        CustomText(content: "votes")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 90,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            repeat: ImageRepeat.noRepeat,
                                            fit: BoxFit.fill,
                                            image: NetworkImage(state
                                                    .movieList?[index].poster ??
                                                "") as ImageProvider,
                                          )),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          weight: FontWeight.bold,
                                          size: 17,
                                          content:
                                              state.movieList?[index].title ??
                                                  ""),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              size: 12, content: "Genre:"),
                                          Container(
                                            width: size.width / 3,
                                            child: CustomText(
                                                size: 12,
                                                content: state.movieList?[index]
                                                        .genre ??
                                                    ""),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            content: "Director:",
                                            size: 12,
                                          ),
                                          Container(
                                            width: size.width / 3,
                                            child: CustomText(
                                                size: 12,
                                                content: state.movieList?[index]
                                                        .director?.first ??
                                                    ""),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              size: 12, content: "starring:"),
                                          Container(
                                            width: size.width / 3,
                                            child: CustomText(
                                                size: 12,
                                                content: state
                                                        .movieList?[index].stars
                                                        ?.join(",") ??
                                                    ""),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: size.width / 1.2,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                hobsPrimary)),
                                    onPressed: () {},
                                    child: CustomText(
                                      content: "watch trailer",
                                      colour: whiteColor,
                                    )),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: state.movieList!.length);
                } else {
                  return CircularProgressIndicator();
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
