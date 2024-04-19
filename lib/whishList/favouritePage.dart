import 'package:fashion_world/ip.dart';
import 'package:fashion_world/whishList/whishlistApi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class FavoritePage extends StatefulWidget {
//   const FavoritePage({super.key});

//   @override
//   State<FavoritePage> createState() => _FavoritePageState();
// }

// class _FavoritePageState extends State<FavoritePage> {
//   @override
//   void initState() {
//     Provider.of<WhishlistApi>(context, listen: false).whishData();
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<WhishlistApi>(builder: (context, provider, child) {
//       if (provider.isLoading || provider.bbdd == null) {
//         // If data is loading or not yet fetched, show loading indicator
//         return Center(
//           child: CircularProgressIndicator(),
          
//         );
    
//       } else {
//         return
        
        
class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: Consumer<WhishlistApi>(
        builder: (context, whishlistApi, child) {
          if (whishlistApi.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (whishlistApi.bbdd == null) {
            return Center(
              child: Text('No items in wishlist'),
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: whishlistApi.bbdd!.sId!.length,
              itemBuilder: (BuildContext context, int index) {
                final item = whishlistApi.bbdd!.sId.toString();
                return GridTile(
                  child: GestureDetector(
                    onTap: () {
                      // Handle item tap
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
            'http://$ip:3000/products-images/${whishlistApi.bbdd!.image![index]}',

                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              whishlistApi.bbdd!.name.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '\$${whishlistApi.bbdd!.price.toString()}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  footer: GridTileBar(
                    backgroundColor: Colors.black45,
                    title: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        // Handle remove from wishlist
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
