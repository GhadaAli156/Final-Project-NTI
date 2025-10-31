import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_nti_app/feature/home_screen/model/product_model.dart';

import '../../../core/firebase/firebase_db.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.firebaseDataBase}) : super(ProductInitial());
  FirebaseDataBase firebaseDataBase ;
  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];

  //get Products from firebase
  Future<void> getProducts() async {
    emit(ProductLoading());
    try {
      products = await firebaseDataBase.getProducts();
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }


  // filter products by type
  //getData by category
  void filterProductsByType(String productType) {
    filteredProducts = products.where((product) {
      return product.category == productType;
    }).toList();
    emit(ProductSuccess(filteredProducts));
  }

  //search products
  void searchProducts(String query) {
    if (query.isEmpty) {
      emit(ProductSuccess(products));
      return;
    }

    final searchResult = products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(ProductSuccess(searchResult));
  }

  //filter products
  void filterProducts({String? category, double? maxPrice}) {
    List<ProductModel> filtered = products;

    if (category != null && category != 'All') {
      filtered = filtered.where((p) => p.category == category).toList();
    }

    if (maxPrice != null) {
      filtered = filtered.where((p) => p.price <= maxPrice).toList();
    }

    emit(ProductSuccess(filtered));
  }

}
