import 'package:fashion_world/cartPages/cartGetApi.dart';
import 'package:fashion_world/cartPages/cartIdGet.dart';
import 'package:fashion_world/checkOut/shippingAddrss.dart';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/whishList/favouritePage.dart';
import 'package:fashion_world/pages/homePage.dart';
import 'package:fashion_world/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void initState() {
    Provider.of<CartGetCart>(context, listen: false).fetchCart();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Consumer<BottomProvider>(
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
        backgroundColor: Colors.transparent,
        title: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Consumer<CartGetCart>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // List view of cart
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                    itemCount: value.aabb?.data?.items?.length ?? 0,
                    padding: EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      final item = value.aabb!.data!.items![index];
                      return Stack(children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 17.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              leading: Image.network(
                                'http://$ip:3000/products-images/${item.product!.image}',
                                height: 36,
                              ),
                              title: Text(
                                item.product?.name ?? '',
                                style: const TextStyle(fontSize: 18),
                              ),
                              subtitle: Text(
                                '\$${item.product?.price ?? 0}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing: Consumer<CartItemPass>(
                                builder: (BuildContext context,
                                    CartItemPass value, Widget? child) {
                                  return IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      value.removeItemFromCart(context,
                                          item.product!.sId.toString());
                                      context.read<CartGetCart>().fetchCart();
                                      Provider.of<CartGetCart>(context,
                                              listen: false)
                                          .fetchCart();
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10.2.h,
                          right: 7.w,
                          child: Row(
                            children: [
                              Consumer<CartItemPass>(
                                builder: (BuildContext context,
                                    CartItemPass value, Widget? child) {
                                  return InkWell(
                                    onTap: () {
                                      value.valueMinus(context,
                                          item.product!.sId.toString());
                                      Provider.of<CartGetCart>(context,
                                              listen: false)
                                          .fetchCart();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(4.sp),
                                      ),
                                      width: 6.w,
                                      height: 3.h,
                                      child: Icon(Icons.remove,
                                          size: 14.sp, color: Colors.black),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, right: 2.w),
                                child: Text(
                                  item.quantity.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                              Consumer<CartItemPass>(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return InkWell(
                                    onTap: () {
                                      value.valueAdd(context,
                                          item.product!.sId.toString());
                                      Provider.of<CartGetCart>(context,
                                              listen: false)
                                          .fetchCart();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(4.sp),
                                      ),
                                      width: 6.w,
                                      height: 3.h,
                                      child: Icon(Icons.add,
                                          size: 14.sp, color: Colors.white),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ]);
                    },
                  ),
                ),
              ),

              // total amount + pay now

              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery Charge: 40',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Total price ${value.aabb!.total}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),

                      // pay now
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShippingAddress()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade200),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: const [
                              Text(
                                'Pay Now',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
