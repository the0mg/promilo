
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo/const/app_bar_pref.dart';
import 'package:promilo/const/app_text.dart';
import 'package:promilo/const/color_const.dart';
import 'package:promilo/dashboard/bottom_navigation_bar.dart';
import 'package:share_plus/share_plus.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {

  List<String> listImg = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXmgNHYZiAMY6BuOm3e9sRruUkDLJBQj0CA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIwp-6PMbLJ3001YaS44Gsd82Dr0AP6uudmA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBj69wRuXWIuvNWTr2KxtpNtel9gi0Z1bgvw&usqp=CAU',
  ];
  double _currentPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double unitHeightValue = size.width * 0.0022;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85 * unitHeightValue),
        child: PrefAppBar(
          text: 'Description',
          onPress: Get.back,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imgWid(),
            descriptionWid(),
          ],
        ),
      ).marginSymmetric(horizontal: 15),
      bottomNavigationBar: Container(
        child: DynamicBottomNavigationBar(
          currentIndex: 2.obs,
          onSelectItem: 2.obs,
        ).marginSymmetric(horizontal: 0),
      ),
    );
  }

  Widget imgWid(){
    return Column(
      children: [
        const SizedBox(height: 10,),
        Column(
          // alignment: Alignment.bottomCenter,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Container(
                //   height: 50,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //       color: Colors.grey
                //   ),
                // ),
                CarouselSlider(
                  items: [
                    for(int i=0; i<listImg.length; i++)
                      Stack(
                        children: [
                          Positioned(
                              bottom: -10,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300
                                ),
                              )
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 400,
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        height: 400,
                                        width: MediaQuery.of(context).size.width,
                                        color: Colors.white,
                                        child: Image.network(
                                            listImg[i].toString(),
                                            // height: 100,
                                            //   width: size.width,
                                            fit: BoxFit.fill
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                  ],
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 5/4,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(milliseconds: 1800),
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentPosition = double.parse(index.toString());
                        });
                      }
                  ),
                ),
                DotsIndicator(
                  dotsCount: listImg.length,
                  position: _currentPosition,
                  reversed: false,
                  decorator: DotsDecorator(
                    activeColor: ColorConst.primaryColor,
                    color: Colors.grey.shade300,
                    spacing: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                  ),
                ).marginOnly(bottom: 20),

              ],
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade300
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.download, size: 30,),
                  Icon(Icons.bookmark, size: 30,),
                  Icon(Icons.favorite, size: 30,),
                  Icon(Icons.document_scanner_rounded, size: 30,),
                  Icon(Icons.star, size: 30,),
                  InkWell(
                    onTap: () {
                      shareApp();
                    },
                      child: Icon(
                        Icons.share, size: 30,
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          children: [
            Icon(Icons.bookmark_border, color: Colors.blueAccent, size: 20,),
            AppText(
              text: '10256',
              fontSize: 13,
              textColor: Colors.grey.shade700,
              txtWeight: FontWeight.w600,
            ),
            const SizedBox(width: 10,),
            Icon(Icons.favorite_border_sharp, color: Colors.blueAccent, size: 20,),
            AppText(
              text: '20256',
              fontSize: 13,
              textColor: Colors.grey.shade700,
              txtWeight: FontWeight.w600,
            ),
            const SizedBox(width: 10,),
            Container(
              decoration: BoxDecoration(
                  // color: Colors.grey.shade300
              ),
              child: Row(
                children: [
                  Icon(Icons.star, size: 20, color: Colors.greenAccent,),
                  Icon(Icons.star, size: 20, color: Colors.greenAccent,),
                  Icon(Icons.star, size: 20, color: Colors.greenAccent,),
                  Icon(Icons.star, size: 20, color: Colors.grey.shade400,),
                  Icon(Icons.star, size: 20, color: Colors.grey.shade400,),
                ],
              ),
            ),
            const SizedBox(width: 10,),
            AppText(
              text: '3',
              fontSize: 14,
              textColor: Colors.blueAccent,
              txtWeight: FontWeight.w600,
            ),
          ],
        ),
        const SizedBox(height: 10,),
      ],
    );
  }

  Widget descriptionWid(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15,),
        AppText(
          text: 'Actor Name',
          fontSize: 17,
          txtWeight: FontWeight.w600,
        ),
        const SizedBox(height: 2,),
        AppText(
          text: 'Indian actress',
          fontSize: 13,
          textColor: Colors.grey.shade700,
          txtWeight: FontWeight.w400,
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            Icon(CupertinoIcons.clock, size: 18,),
            const SizedBox(width: 2,),
            AppText(
              text: 'Duration 20 minutes',
              fontSize: 14,
              textColor: Colors.grey.shade700,
              txtWeight: FontWeight.w400,
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            Icon(Icons.account_balance_wallet_rounded, size: 18,),
            const SizedBox(width: 2,),
            AppText(
              text: 'Total average fees ₹11111',
              textColor: Colors.grey.shade700,
              txtWeight: FontWeight.w400,
            ),
          ],
        ),
        const SizedBox(height: 25,),
        AppText(
          text: 'About',
          fontSize: 17,
          txtWeight: FontWeight.w600,
        ),
        const SizedBox(height: 5,),
        AppText(
          text: 'Actors express ideas and portray characters in theater, film, television, and other performing arts media.'
              ' They interpret a writer\'s script to entertain or inform an audience.'
              ' An actor or actress is a person who portrays a character in a production.'
              ' The actor performs "in the flesh" in the traditional medium of the theatre or in modern media such as film,'
              ' radio, and television. The analogous Greek term is ὑποκριτής (hupokritḗs), literally "one who answers".',
          textColor: Colors.grey.shade700,
          fontSize: 14,
          txtWeight: FontWeight.w400,
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppText(
              text: 'See more',
              fontSize: 14,
              textColor: Colors.blueAccent,
              txtWeight: FontWeight.w600,
            ),
          ],
        ),
        const SizedBox(height: 10,),
      ],
    );
  }

  Future<void> shareApp() async {
    String link = '';
    if(GetPlatform.isIOS){
      link = 'https://apps.apple.com/in/app/instagram/id389801252';
    }else{
      link = 'https://play.google.com/store/apps/details?id=com.instagram.android&hl=en';
    }
    await Share.share(
      subject: 'Promilo',
      'Experience a world of expanded services and convenience of Instagram by downloading our app through the provided link.\n$link',
    );
  }
}
