import 'package:flutter/cupertino.dart';

import '../model/api_response/api_response.dart';
import '../model/product_details_model.dart';
import '../model/product_list_model.dart';
import '../network_client/network_clients.dart';

class ProductsHelper {
  final NetworkClient _networkClient;

  ProductsHelper(this._networkClient);

  ///
  ///
  ///

  //
  //
  Future<ApiResponse<ProductListModel>> getProductsList(
      {required BuildContext context}) async {
    var resp = await _networkClient.get<ProductListModel>(
      'products',
      queryParameters: {'': ''},
      context: context,
    );
    if (resp.isSuccess && resp.rawData != null) {
      final result = resp.rawData;
      final data = ProductListModel.fromJson(result!);
      return resp.copyWith(data: data);
    } else {
      return resp;
    }
  }

  ///
  ///
  ///

  Future<ApiResponse<ProductDetailsModel>> getProductsDetails(
      {required BuildContext context, String? pID}) async {
    var resp = await _networkClient.get<ProductDetailsModel>(
      // 'products/$pID',
      'products/$pID',
      queryParameters: {},
      context: context,
    );
    if (resp.isSuccess && resp.rawData != null) {
      final result = resp.rawData;
      final data = ProductDetailsModel.fromJson(result!);
      return resp.copyWith(data: data);
    } else {
      return resp;
    }
  }
}
