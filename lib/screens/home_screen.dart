
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo/const/app_bar_pref.dart';
import 'package:promilo/const/app_btn.dart';
import 'package:promilo/const/app_text.dart';
import 'package:promilo/const/color_const.dart';
import 'package:promilo/screens/description_page.dart';
import 'package:signed_spacing_flex/signed_spacing_flex.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController searchCtr = TextEditingController();
  List<String> listImg = ['https://img.freepik.com/free-photo/woman-meeting-with-raised-hand_1262-731.jpg',
  'https://static9.depositphotos.com/1037987/1188/i/450/depositphotos_11886437-stock-photo-mixed-group-in-business-meeting.jpg',
  // 'https://www.pens.com/blog/wp-content/uploads/2017/07/Businesspeople-Attending-a-Work-Conference.jpg',
  'https://img.freepik.com/free-photo/woman-meeting-with-raised-hand_1262-731.jpg',
  'https://static9.depositphotos.com/1037987/1188/i/450/depositphotos_11886437-stock-photo-mixed-group-in-business-meeting.jpg',
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
          text: 'Individual Meetup',
          onPress: Get.back,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            searchWid(),
            const SizedBox(height: 10,),
            imgWid(),
            const SizedBox(height: 25,),
            popularWid(),
            const SizedBox(height: 25,),
            topTradeWid(),
            const SizedBox(height: 10,),
          ],
        ),
      ).marginSymmetric(horizontal: 15, vertical: 5),
    );
  }

  Widget searchWid(){
    Size size = MediaQuery.of(context).size;
    double unitHeightValue = size.width * 0.0022;
    return Container(
      // width: size.width/1.1,
      // height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
          ),
          suffixIcon: const Icon(
              Icons.settings_voice_sharp,
          ),
          filled: true,
          prefixIconColor: Colors.grey,
          contentPadding: const EdgeInsets.symmetric(vertical: -3, horizontal: 10),
          fillColor: ColorConst.primaryColor,
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 14 * unitHeightValue,
          ),
        ),

        controller: searchCtr,
        style: TextStyle(
          fontSize: 16 * unitHeightValue,
        ),
        minLines: 1,
        maxLines: 1,
      ),
    );
  }

  Widget imgWid(){
    return Column(
      children: [
        Column(
          // alignment: AlignmentDirectional.bottomCenter,
          children: [
            listImg.length > 0 ? CarouselSlider(
              items: [
                for(int i=0; i<listImg.length; i++)
                   ClipRRect(
                     borderRadius: BorderRadius.circular(20),
                     child: Container(
                       height: 100,
                       width: MediaQuery.of(context).size.width,
                       child: Stack(
                         alignment: Alignment.bottomLeft,
                         children: [
                           Container(
                             // height: 100,
                             width: MediaQuery.of(context).size.width,
                             color: Colors.white,
                             child: Image.network(
                                 listImg[i].toString(),
                                // height: 100,
                                //   width: size.width,
                                fit: BoxFit.fill
                            ),
                           ),
                           AppText(
                             text: 'Popular Meetups\n in India',
                             textColor: Colors.black,
                             fontSize: 18,
                             txtWeight: FontWeight.w600,
                           ).marginSymmetric(horizontal: 10, vertical: 15),
                         ],
                       ),
                     ),
                   ),
              ],
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 5/3,
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
            ) : const SizedBox(),
            const SizedBox(height: 10,),
            DotsIndicator(
              dotsCount: listImg.length,
              position: _currentPosition,
              reversed: false,
              decorator: const DotsDecorator(
                activeColor: ColorConst.secondaryColor,
                color: Colors.grey,
                spacing: EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget popularWid(){
    const imageURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Instagram_logo_2022.svg/150px-Instagram_logo_2022.svg.png";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15,),
        AppText(
          text: 'Trending Popular People',
          fontSize: 17,
          txtWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for(int i=0; i<5; i++)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.2
                    ),
                  ),
                  child: Container(
                    width: 300,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 23,
                              backgroundColor: ColorConst.secondaryColor,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage('https://www.penhouse.in/media/catalog/product/2/1/21530-1c.jpg?width=265&height=265&store=default&image-type=image'),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: 'Author',
                                  fontSize: 17,
                                  txtWeight: FontWeight.w600,
                                ),
                                AppText(
                                  text: '1028 members',
                                  fontSize: 14,
                                  textColor: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 7,),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 0.8,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        SignedSpacingRow(
                          spacing: -12.0,
                          stackingOrder: StackingOrder.lastOnTop,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundImage: NetworkImage(imageURL),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundImage: NetworkImage(imageURL),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundImage: NetworkImage(imageURL),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ColorConst.secondaryColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: AppText(
                                text: 'See more',
                                textColor: Colors.white,
                                txtWeight: FontWeight.w600,
                              ).marginSymmetric(horizontal: 20, vertical: 10),
                            ),
                          ],
                        ),
                      ],
                    ).marginSymmetric(vertical: 12, horizontal: 12),
                  ),
                ).marginOnly(right: 15)
            ],
          ),
        )
      ],
    );
  }

  Widget topTradeWid(){
    const imageURL = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCNLtz0nAmDcTPDsklRKDynw_BhWuFc9Cfbg&usqp=CAU";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15,),
        AppText(
          text: 'Top Trending Meetups',
          fontSize: 17,
          txtWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for(int i=0; i<4; i++)
                InkWell(
                  onTap: () {
                    Get.to(()=>const DescriptionPage());
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          color: Colors.white,
                          child: Image.network(
                              imageURL.toString(),
                              fit: BoxFit.fill
                          ),
                        ),
                      ],
                    ),
                  ),
                ).marginOnly(right: 15),
            ],
          ),
        )
      ],
    );
  }
}
