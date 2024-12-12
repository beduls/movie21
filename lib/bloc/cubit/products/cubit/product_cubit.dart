import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie21/bloc/cubit/products/cubit/product_state.dart';
import 'package:movie21/services/nginfoin/responses/product_response.dart';

class ProductCubit extends Cubit<ProductState> {
  // late final ProductRemoteData productRemoteData;
  late final ProductResponse productResponse;

  ProductCubit(this.productResponse) : super(const ProductState());

  Future<void> loadData(int hal, int jml) async {
    emit(state.copyWith(loading: true));
    try {
      final response = await productResponse.getProduct(page: hal, size: jml);
      emit(state.copyWith(loading: false, products: response));
    } catch (e) {
      emit(state.copyWith(loading: false));
    }
  }
}
