import 'package:fashion_world/cartPages/cartUi.dart';
import 'package:fashion_world/editProfile/editProfile.dart';
import 'package:fashion_world/editProfile/imgProvider.dart';
import 'package:fashion_world/editProfile/profileService.dart';
import 'package:fashion_world/ordersPages/active.dart';
import 'package:fashion_world/pages/privacyPolicy.dart';
import 'package:fashion_world/whishList/favouritePage.dart';
import 'package:fashion_world/pages/homePage.dart';
import 'package:fashion_world/provider/bottomProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../registerPages/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<BottomProvider>(context, listen: false)
        .onItemTapped(_selectedIndex);
    Provider.of<ProfileProvider>(context, listen: false).getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //       bottomNavigationBar: Consumer<BottomProvider>(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoritePage()));
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
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (contex) => HomePage()));
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
        ),
        body: SingleChildScrollView(child: Consumer<ProfileProvider>(builder:
            (BuildContext context, ProfileProvider value, Widget? child) {
          if (value.isloading || value.data == null) {
            // If data is loading or not yet fetched, show loading indicator
            return Center(
              child: SpinKitChasingDots(
  color: Color.fromARGB(255, 7, 108, 190),
  size: 50.0,
  
),
            );
          } else {
            return Column(children: [
              Stack(
                children: [
                  Center(
                    child: Consumer<ImgProvider>(
                      builder: (BuildContext context,  value, Widget? child) {
                        return  CircleAvatar(
                        radius: 55.sp,
                        backgroundImage:
                        
                              value.img != null ? FileImage(value.img!) : null,
                         
                      );
                        },
                      
                    ),
                  ),
                                 ],
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<ProfileProvider>(builder:
                  (BuildContext context, ProfileProvider value, Widget? child) {
                return Text(value.data.data!.name.toString());
              }),
              Positioned(
                right: 40,
                top: 80,
                child: Consumer<ProfileProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Text(value.data.data!.phoneno.toString());
                  },
                ),
              ),
              const SizedBox(height: 80),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()));
                    },
                    child: profileRow('Your Profile', Icons.person),
                  ),
                  Divider(),
                  // profileRow('Payment Methods', Icons.payment),
                  // Divider(),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ActivePage()));
                    },
                    child: profileRow('My Orders', Icons.shop)),
                  Divider(),
                  // profileRow('Settings', Icons.settings),
                  // Divider(),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicyPage()));
                    },
                    child: profileRow('Privacy Policy', Icons.lock)),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: profileRow('Log Out', Icons.logout),
                  ),
                ],
              ),
            ]);
          }
        })));
  }
}

Padding profileRow(String name, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon),
        Text(
          name,
          style: TextStyle(fontSize: 18),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward_ios_outlined),
        ),
      ],
    ),
  );
}
