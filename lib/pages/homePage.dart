// ignore_for_file: sort_child_properties_last, curly_braces_in_flow_control_structures

import 'package:fashion_world/Container_Stack/fancy_Cont.dart';
import 'package:fashion_world/category/homeElectronics.dart';
import 'package:fashion_world/category/homeFancy.dart';
import 'package:fashion_world/category/homeFasion.dart';
import 'package:fashion_world/category/homeJwellery.dart';
import 'package:fashion_world/lightandDarkTheme/lightAndDark.dart';
import 'package:fashion_world/model/paginationModel/allProductPage.dart';
import 'package:fashion_world/search/searchPage.dart';
import 'package:fashion_world/search/searchProvider.dart';
import 'package:fashion_world/provider/dataModel.dart';
import 'package:fashion_world/whishList/whishlistApi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../Container_Stack/electronics_Cont.dart';
import '../Container_Stack/jwellery_Cont.dart';
import '../swiperPage/swiper.dart';
import '../Container_Stack/fasionCont.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final TextEditingController _searchController = TextEditingController();

  int _selectedIndex = 0;

//flutter/fhome
  void initState() {
    // Provider.of<BottomProvider>(context, listen: false);
    Provider.of<DataProvider>(context, listen: false).fetchData();
    Provider.of<WhishlistApi>(context, listen: false).whishData();
    Provider.of<SearchProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            // HomeGetData();
          },
          child: Text(
            "Ecommerce App",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Consumer<ThemeProvider>(
            builder: (BuildContext context, theme, Widget? child) {
              return Switch(
                  value: theme.getTheme() == darkMode,
                  onChanged: (value) {
                    toggleTheme(context);
                  });
            },
          )
        ],
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 54, 150, 230),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 54, 150, 230),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(23),
                          bottomRight: Radius.circular(23))),
                  width: MediaQuery.of(context).size.width,
                  height: 13.h,
                ),
                Positioned(
                  left: 3.w,
                  top: 3.h,
                  child: InkWell(
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        'Search here.....',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                  width: 80.w,
                  height: 50,
                ),
                Positioned(
                  top: 3.h,
                  right: 5.w,
                  child: Container(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu_open_sharp,
                          color: Colors.blue,
                          size: 22,
                        )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: 10.w,
                    height: 5.h,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              height: 200,
              width: 300,
              child: SwiperPage(),
            ),

            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductListPage()));
                    },
                    child: Text('View All',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15
                    
                    ),),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                HomeElectronics(),
                HomeFasion(),
                HomeFancy(),
                HomeJwellery()
              ],
            ),
            SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 5.h,
                // color: Colors.lightGreenAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fasion',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(height: 33.h, child: FasionStack()),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 5.h,
                // color: Colors.lightBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Electronics',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (contex) => CartPage()));
                        },
                        icon: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
            ),
            // SizedBox(height: 10,),
            // BannerOne(),

            Container(height: 33.h, child: ElecronicsStack()),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 4.h, // Reduce the height here
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jwellery',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
            ),
            JwelleryStack(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 4.h, // Reduce the height here
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fancy',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
            ),
            FancyStack(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
