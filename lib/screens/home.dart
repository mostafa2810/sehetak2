import 'package:sehetak2/consts/colors.dart';
import 'package:sehetak2/inner_screens/brands_navigation_rail.dart';
import 'package:sehetak2/provider/products.dart';
import 'package:sehetak2/screens/feeds.dart';
import 'package:sehetak2/widget/backlayer.dart';
import 'package:sehetak2/widget/category.dart';
import 'package:sehetak2/widget/popular_products.dart';
import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _carouselImages = [
    'assets/images/flat-lay-pills-syringe-with-copy-space 1.jpg',
    'assets/images/carousel2.jpeg',
    'assets/images/carousel3.jpg',
    'assets/images/carousel4.png',
  ];

  List _brandImages = [
    'assets/images/Himalaya-Vector-Logo.png',
    'assets/images/accu-chek-logo-vector.png',
    'assets/images/download.jpg',
    'assets/images/vlcc-personal-care-logo-vector.png',
    'assets/images/merck_ifl_logo.jpg',
    'assets/images/pharco.png',
    'assets/images/epico.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    productsData.fetchProducts();
    final popularItems = productsData.popularProducts;
    print('popularItems length ${popularItems.length}');
    return Scaffold(
      body: BackdropScaffold(
        frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        headerHeight: MediaQuery.of(context).size.height * 0.25,
        appBar: BackdropAppBar(
          title: Text("Home"),
          leading: BackdropToggleButton(icon: AnimatedIcons.home_menu),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              ColorsConsts.starterColor,
              ColorsConsts.endColor
            ])),
          ),
          actions: <Widget>[
            IconButton(
              iconSize: 15,
              padding: const EdgeInsets.all(10),
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 13,
                  backgroundImage: NetworkImage(
                      'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
        backLayer: BackLayerMenu(),
        frontLayer: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 190.0,
                width: double.infinity,
                child: Carousel(
                  boxFit: BoxFit.fill,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 5.0,
                  dotIncreasedColor: Colors.amberAccent,
                  dotBgColor: Colors.black.withOpacity(0.2),
                  dotPosition: DotPosition.bottomCenter,
                  showIndicator: true,
                  indicatorBgPadding: 5.0,
                  images: [
                    ExactAssetImage(_carouselImages[0]),
                    ExactAssetImage(_carouselImages[1]),
                    ExactAssetImage(_carouselImages[2]),
                    ExactAssetImage(_carouselImages[3]),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    
                    width: double.infinity,
                    height: 180,
                    child: ListView.builder(
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext ctx, int index) {
                        return CategoryWidget(
                          index: index,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Text(
                        'Popular Brands',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            BrandNavigationRailScreen.routeName,
                            arguments: {
                              7,
                            },
                          );
                        },
                        child: Text(
                          'See more...',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Color(0xFF80B1FE)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 90.0,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Swiper(
                  itemCount: _brandImages.length,
                  autoplay: true,
                  viewportFraction: 0.3,
                  scale: 0.5,
                  onTap: (index) {
                    Navigator.of(context).pushNamed(
                      BrandNavigationRailScreen.routeName,
                      arguments: {
                        index,
                      },
                    );
                  },
                  itemBuilder: (BuildContext ctx, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          _brandImages[index],

                          // fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Container(
              //   height: 170.0,
              //   width:
              //   MediaQuery.of(context).size.width * 0.95,
              //   child: Swiper(
              //     itemCount: _brandImages.length,
              //     autoplay: true,
              //     viewportFraction: 0.8,
              //     scale: 0.9,
              //     onTap: (index) {
              //       Navigator.of(context).pushNamed(
              //         BrandNavigationRailScreen.routeName,
              //         arguments: {
              //           index,
              //         },
              //       );
              //     },
              //     itemBuilder: (BuildContext ctx, int index) {
              //       return ClipRRect(
              //         borderRadius: BorderRadius.circular(70),
              //         child: Container(

              //           color: Colors.blueGrey,
              //           child: Image.asset(
              //             _brandImages[index],
              //             fit: BoxFit.fill,
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Popular Products',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(Feeds.routeName, arguments: 'popular');
                      },
                      child: Text(
                        'See more...',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color: Color(0xFF80B1FE)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 285,
                margin: EdgeInsets.symmetric(horizontal: 3),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularItems.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return ChangeNotifierProvider.value(
                        value: popularItems[index],
                        child: PopularProducts(
                            // imageUrl: popularItems[index].imageUrl,
                            // title: popularItems[index].title,
                            // description: popularItems[index].description,
                            // price: popularItems[index].price,
                            ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
