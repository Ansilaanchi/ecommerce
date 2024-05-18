import 'package:fashion_world/provider/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:fashion_world/cartPages/cartIdGet.dart';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/productDetailsView/jwelleryView.dart';
import 'package:fashion_world/whishList/whishlistIdPass.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class JwelleryStack extends StatefulWidget {
  const JwelleryStack({super.key});

  @override
  State<JwelleryStack> createState() => _JwelleryStackState();
}

class _JwelleryStackState extends State<JwelleryStack> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<DataProvider>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading || provider.homeData == null) {
          return Center(
            child: SpinKitCircle(
            color: Color.fromARGB(255, 71, 161, 235),
            size: 40.0.sp,
          ),
          );
        } else {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 30.h,
            child: ListView.builder(
              itemCount:
                  provider.homeData?.categorizedProducts?.jwellery?.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final jwellery =
                    provider.homeData!.categorizedProducts!.jwellery![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JwelleryViewPage(
                          productName: jwellery.name ?? "",
                          productImage: jwellery.image ?? "",
                          productPrice: jwellery.price.toString(),
                          productId: jwellery.id.toString(),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            height: 28.h,
                            width: 42.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 247, 244, 244)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: 35.w,
                                  height: 15.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'http://$ip:3000/products-images/${jwellery.image}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 2.w,
                                  child: Consumer<WhishlistIdPass>(
                                    builder: (context, value, child) {
                                      return IconButton(
                                        onPressed: () {
                                          value.addAndRemove(
                                              context, jwellery.id);
                                          // Add your favorite button functionality here
                                          print("favorite button");
                                        },
                                        icon: Icon(
                                          Icons.favorite_border_rounded,
                                          color: Colors.red,
                                          size: 19.sp,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  top: 18.8.h,
                                  child: Container(
                                    width: 40.w,
                                    height: 12.h,
                                  ),
                                ),
                                Positioned(
                                  bottom: 65,
                                  left: 8,
                                  child: Text(
                                    jwellery.name ?? "",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 48,
                                  left: 8,
                                  child: Text(
                                    '\$ ${jwellery.price}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 2, 2, 2),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Positioned(
                                  right: 3.w,
                                  bottom: 0.h,
                                  child: IconButton(
                                    onPressed: () {
                                      Provider.of<CartItemPass>(context,
                                              listen: false)
                                          .addItemToCart(context, jwellery.id);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.blue,
                                          content: Text(
                                              'Added to Cart: ${jwellery.name}'),
                                        ),
                                      );
                                      print("Add to Cart: ${jwellery.name}");
                                    },
                                    icon: Icon(
                                      Icons.shopping_cart,
                                      size: 22.sp,
                                      color: Colors.pink,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
