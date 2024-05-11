import 'package:fashion_world/ip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fashion_world/search/searchProvider.dart';
import 'package:sizer/sizer.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Here you should call your API or perform search operation to get the results
    Provider.of<SearchProvider>(context, listen: false).getAllPosts(query);
    return SearchPage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/istockphoto-1363841854-612x612.jpg'))
      ),
    ); // You can leave this empty since you don't need suggestions
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (BuildContext context, search, Widget? child) {
        if (search.isloading) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
            ),
          );
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 2,
            ),
            itemCount: search.data.searchitems!.length,
            itemBuilder: (context, index) {
              var product = search.data.searchitems?[index];
              return InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SearchProduct(
                  //       productName: product.name.toString(),
                  //       productImage: product.image.toString(),
                  //       productPrice: product.price.toString(),
                  //       productId: product.id.toString(),
                  //     ),
                  //   ),
                  // );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                'http://$ip:3000/products-images/${product!.image!}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 8.h,
                        width: 30.6.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price : ${product.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              product.name ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
