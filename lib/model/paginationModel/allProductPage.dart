import 'dart:developer';
import 'package:fashion_world/AllProducts/paginationApi.dart';
import 'package:fashion_world/ip.dart';
import 'package:fashion_world/productDetailsView/electronicsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PaginationDataProvider>(context, listen: false).getAllPosts(1);
    // });
  }

  @override
  Widget build(BuildContext context) {
    log("Building ProductListPage");
    Future<void> _refresh() {
      return Future.delayed(Duration(seconds: 1)).then((_) {
        Provider.of<PaginationDataProvider>(context, listen: false).getAllPosts(1);
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "All Products",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Consumer<PaginationDataProvider>(
        builder: (context, provider, child) {
          log('Provider State: isLoading=${provider.isLoading}, hasMore=${provider.hasMore}');
          if (provider.isLoading && provider.allProducts.product!.isEmpty) {
            return Center(
              child: SpinKitChasingDots(
                color: Color.fromARGB(255, 7, 108, 190),
                size: 50.0,
              ),
            );
          }
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
                  !provider.isLoading && provider.hasMore) {
                log('Reached end of scroll. Loading more data...');
                provider.loadMore();
              }
              return false;
            },
            child: RefreshIndicator(
              color: Colors.blue,
              onRefresh: _refresh,
              child: ListView.builder(
                itemCount: provider.allProducts.product!.length + 1,
                itemBuilder: (context, index) {
                  if (index == provider.allProducts.product!.length) {
                    if (provider.isLoading) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                      );
                    } else if (!provider.hasMore) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Center(
                          child: Text(
                            "No more products",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 220, 217, 217),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
            
            
                    }
                  }

                  var product = provider.allProducts.product![index];
                  log('Rendering product: ${product.name}');
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ElectronicsPage(
                              productName: product.name.toString(),
                              productImage: product.image.toString(),
                              productPrice: product.price.toString(),
                              productId: product.id.toString(),
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 1.9.h, horizontal: 3.7.w),
                      padding: EdgeInsets.only(top: 2.h),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 210, 211, 209),
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      height: 15.h,
                      width: 50.w,
                      child: ListTile(
                        leading: Image.network(
                          'http://${ip}:3000/products-images/${product.image!}',
                        ),
                        title: Text(
                          product.name ?? 'No name',
                          style: TextStyle(fontSize: 13.sp, color: Colors.black),
                        ),
                        subtitle: Text(
                          "Price: ${product.price}",
                          style: TextStyle(fontSize: 9.sp, color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
