import 'package:fashion_world/editProfile/editProfile.dart';
import 'package:fashion_world/editProfile/imgProvider.dart';
import 'package:fashion_world/editProfile/profileService.dart';
import 'package:fashion_world/ordersPages/myOrders.dart';
import 'package:fashion_world/pages/privacyPolicy.dart';
import 'package:fashion_world/provider/bottomProvider.dart';
import 'package:fashion_world/registerPages/logOutProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

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
       
        appBar: AppBar(
          automaticallyImplyLeading: false,
          
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
                builder: (BuildContext context, imgProvider, Widget? child) {
                  if (imgProvider.isLoading) {
                    return CircularProgressIndicator(
                      strokeAlign: -5,
                      color: Colors.grey,
                    );
                  }
                  return imgProvider.img != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(imgProvider.img!),
                          radius: 50.sp,
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/blank-profile-picture-973460_960_720.webp'),
                          radius: 50.sp,
                        );
                },
              ),
            ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
           Consumer<ProfileProvider>(
              builder: (BuildContext context, profile, Widget? child) {
                if (profile.isloading) {
                  return Center(
                    heightFactor: 0.4.h,
                    child: CircularProgressIndicator(
                      strokeAlign: -5,
                      color: Colors.grey,
                    ),
                  );
                }
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Center(
                        child: Text(
                          profile.data.data?.name ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: Text(
                        profile.data.data?.email ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 8.sp),
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

                  // profileRow('Payment Methods', Icons.payment),
                  // Divider(),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyOrders()));
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>ActivePage()));
                      },
                      child: profileRow('My Orders', Icons.shop)),

                  // profileRow('Settings', Icons.settings),
                  // Divider(),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyPolicyPage()));
                      },
                      child: profileRow('Privacy Policy', Icons.lock)),

                  InkWell(
                    onTap: () {
                       LogOutProvider().logout(context);
                    },
                    child: profileRow('Log Out', Icons.logout),
                  ),
                ],
              ),
            ]);
          
        })]);
   }} )
  ));
  }
}

Padding profileRow(String name, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      height: 7.h,
      width: double.infinity,
      decoration: BoxDecoration(
// color: Colors.amber,
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
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
    ),
  );
}
