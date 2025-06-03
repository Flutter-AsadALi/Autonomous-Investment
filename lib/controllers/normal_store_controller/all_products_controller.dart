import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../app_helper/products_helper.dart';
import '../../model/product_details_model.dart';
import '../../model/product_list_model.dart';
import '../../network_client/network_clients.dart';

class AllProductsController with ChangeNotifier {
  //
  ///

  late BuildContext _context;
  late ProductListModel productListModel;
   ProductDetailsModel? productDetailsModel;

  // late String pId;

  final TextEditingController searchController = TextEditingController();
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  List<Product> filteredProducts = [];
  List<Product> allProducts = [];

  int rowsProducts = 10;
  int pageProducts = 1;

  BuildContext get context => _context;

  void setContext(BuildContext context) {
    _context = context;
  }

  bool _isLoading = false;

  bool _isLoadingDetails = false;

  bool get isLoading => _isLoading;

  bool get isLoadingDetails => _isLoadingDetails;

  //
  //

//CONSTRUCTOR
  AllProductsController() {
    rowsProducts = 10;

    pageProducts = 1;
    _productsHelper = ProductsHelper(NetworkClient());
  }

  void resetFormData() {
    rowsProducts = 10;
    pageProducts = 1;

    notifyListeners();
  }

  ///
  ///
  ///
  void filterProducts(String query) {
    if (query.isEmpty) {
      filteredProducts = allProducts;
    } else {
      final lowerCaseQuery = query.toLowerCase();
      filteredProducts = allProducts.where((product) {
        return product.title!.toLowerCase().contains(lowerCaseQuery) ||
            product.brand.toString().toLowerCase().contains(lowerCaseQuery) ||
            product.price.toString().toLowerCase().contains(lowerCaseQuery) ||
            product.availabilityStatus!.toLowerCase().contains(lowerCaseQuery);
      }).toList();
    }
    notifyListeners();
  }

  void resetProducts() {
    filteredProducts = allProducts;
    searchController.text = "";
    searchController.clear();
    notifyListeners();
  }

  late ProductsHelper _productsHelper;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setLoadingDetails(bool loading) {
    _isLoadingDetails = loading;
    notifyListeners();
  }

  // Function to fetch initial order list
  Future<void> getProductsList(BuildContext context,
      {bool isPag = false}) async {
    try {
      !isPag ? setLoading(true) : context.loaderOverlay.show();
      if (!isPag) {
        pageProducts = 1;
        filteredProducts.clear();
        allProducts.clear();

        final response =
            await _productsHelper.getProductsList(context: context);
        if (response.data != null && response.isSuccess) {
          productListModel = response.data!;
          allProducts = productListModel.products ?? [];
        }
      }
      _applyPagination();
      refreshController.loadComplete();
      if ((rowsProducts * pageProducts) >= allProducts.length) {
        refreshController.loadNoData();
      } else {
        pageProducts++;
      }
    } catch (e) {
      refreshController.loadFailed();
    } finally {
      !isPag ? setLoading(false) : context.loaderOverlay.hide();
    }
  }

   getProductsDetails(BuildContext context, String pId) async {
    try {
      setLoadingDetails(true);

      final response =
          await _productsHelper.getProductsDetails(context: context, pID: pId);
      if (response.data != null && response.isSuccess) {
        productDetailsModel = response.data!;
        setLoadingDetails(false);
      }
    } catch (e) {
      // refreshController.loadFailed();
    } finally {

    }
  }

  void _applyPagination() {
    filteredProducts = allProducts.take(rowsProducts * pageProducts).toList();
    notifyListeners();
  }
}
