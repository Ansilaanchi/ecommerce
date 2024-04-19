import 'package:fashion_world/cartPages/cartUi.dart';
import 'package:fashion_world/whishList/favouritePage.dart';
import 'package:fashion_world/provider/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../Container_Stack/electronics_Cont.dart';
import '../Container_Stack/jwellery_Cont.dart';
import '../category/viewAll.dart';
import '../swiperPage/swiper.dart';
import '../Container_Stack/foodContainer.dart';
import '../category/categories.dart';
import 'profilePage.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //flutter/bottom
      //  bottomNavigationBar: Consumer<BottomProvider>(
      //   builder: (context, provider, child) => CurvedNavigationBar(
      //     key: provider.navigatorKey,
      //     index: provider.selectedIndex,
      //     items: provider.items,
      //     onTap: provider.onItemTapped,
      //   ),
      // ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_bag),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border_outlined),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavoritePage()));
                },
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              )
            ],
          ),
        ),
      ),

      appBar: AppBar(
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
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()
                        //  ProfilePage()
                        ));
              },
              icon: Icon(Icons.notifications))
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
                  height: 10.h,
                ),
                Positioned(
                    left: 3.w,
                    top: 3.h,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      // ignore: sort_child_properties_last
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 205, 204, 204)),
                            border: InputBorder.none,
                            prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.manage_search_outlined,
                                  color: Colors.blue,
                                ))),
                      ),
                      width: 80.w,
                      height: 5.h,
                    )),
                Positioned(
                  top: 3.h,
                  right: 5.w,
                  child: Container(
                    // ignore: sort_child_properties_last
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CartPage();
                          }));
                        },
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

            // SizedBox(height: 15,),
            // Container(
            //   height: 6.h,
            //   width: double.infinity,
            //   // color: Colors.deepPurpleAccent,
            //   child: RowCategory(),
            // ),

            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 300,
              child: SwiperPage(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewAll()),
                      );
                    },
                    child: Text(
                      'View All',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Category(),
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
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (contex)=>ProductListScreen()));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contex) => CartPage()));
                        },
                        icon: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(height: 33.h, child: DressContainer()),

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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contex) => CartPage()));
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
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 5.h,
                // color: Colors.indigoAccent,
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
            jwelleryStack(),
          ],
        ),
      ),
    );
  }
}
