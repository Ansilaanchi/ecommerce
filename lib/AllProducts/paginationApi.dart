// ignore_for_file: unused_import
import 'dart:developer';
import 'package:fashion_world/AllProducts/paginationService.dart';
import 'package:fashion_world/model/paginationModel/all_products/all_products.dart';
import 'package:flutter/material.dart';

class PaginationDataProvider extends ChangeNotifier {
  final service = PaginationService();
  bool isLoading = false;
  AllProductModel _allProducts = AllProductModel(product: []);
  AllProductModel get allProducts => _allProducts;

  int currentPage = 1;
  bool hasMore = true;

  Future<void> getAllPosts(int page) async {
    if (isLoading || !hasMore) return;

    isLoading = true;
    notifyListeners();

    final res = await service.getAll(page);
    if (res.product != null && res.product!.isNotEmpty) {
      _allProducts.product!.addAll(res.product!);
      currentPage = res.currentPage ?? currentPage;
      hasMore = res.currentPage! < res.totalPages!;
    } else {
      hasMore = false;
    }

    isLoading = false;
    notifyListeners();
  }

  void loadMore() {
    if (hasMore && !isLoading) {
      getAllPosts(currentPage + 1);
    }
  }
}