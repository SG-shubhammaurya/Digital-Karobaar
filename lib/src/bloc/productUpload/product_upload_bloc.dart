// import 'package:digitalkarobaar/src/repository/product_upload_repo.dart';
// import 'package:digitalkarobaar/src/res/connectivity.dart';
// import 'package:dio/src/form_data.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'product_upload_state.dart';

// class ProductUploadCubit extends Cubit<ProductUploadState>
//     with ConnectivityChecker {
//   ProductUploadCubit(this.productUploadRepo) : super(ProductInitialSate());
//   ProductUploadRepo productUploadRepo;

//   getCategories(String name) async {
//     try {
//       if (!await isConnected()) {
//         emit(ErrorState('Please Check Your NetWork Connection'));
//         return;
//       }
//       emit(LoadingStateCategories());
//       final result = await productUploadRepo.getCategories();
//       emit(GetCategories(result));
//     } catch (e) {
//       emit(ErrorState(e.toString()));
//     }
//   }

//   getSubCategories(String prodId) async {
//     try {
//       if (!await isConnected()) {
//         emit(ErrorState('Please Check Your NetWork Connection'));
//         return;
//       }
//       emit(LoadingStateSubCategories());
//       final result = await productUploadRepo.getSubCategories(prodId);
//       emit(GetSubCategories(result));
//     } catch (e) {
//       emit(ErrorState(e.toString()));
//     }
//   }

//   getBrands(String id) async {
//     try {
//       if (!await isConnected()) {
//         emit(ErrorState('Please Check Your NetWork Connection'));
//         return;
//       }
//       emit(LoadingStateBrand());
//       final result = await productUploadRepo.getBrand(id);
//       emit(GetBrandState(result));
//     } catch (e) {
//       emit(ErrorState(e.toString()));
//     }
//   }

//   uploadProduct( Map<dynamic,dynamic> data) async {
//     try {
//       if (!await isConnected()) {
//         emit(ErrorState('Please Check Your NetWork Connection'));
//         return;
//       }
//        emit(LoadingStateProduct());
//       final result = await productUploadRepo.uploadProducts(data);
//      // emit(GetBrandState(result));
//     } catch (e) {
//       emit(ErrorState(e.toString()));
//     }
//   }

//   uploadProductAsMember( Map<dynamic,dynamic> data) async {
//     try {
//       if (!await isConnected()) {
//         emit(ErrorState('Please Check Your NetWork Connection'));
//         return;
//       }
//       emit(LoadingStateProduct());
//       final result = await productUploadRepo.memberUplaodProducts(data);
//       //emit(GetBrandState(result));
//     } catch (e) {
//       emit(ErrorState(e.toString()));
//     }
//   }
// }

import 'package:digitalkarobaar/src/repository/product_upload_repo.dart';
import 'package:digitalkarobaar/src/res/connectivity.dart';
import 'package:dio/src/form_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_upload_state.dart';

class ProductUploadCubit extends Cubit<ProductUploadState>
    with ConnectivityChecker {
  ProductUploadCubit(this.productUploadRepo) : super(ProductInitialSate());
  ProductUploadRepo productUploadRepo;

  getCategories(String name) async {
    try {
      if (!await isConnected()) {
        emit(ErrorState('Please Check Your NetWork Connection'));
        return;
      }
      emit(LoadingStateCategories());
      final result = await productUploadRepo.getCategories();
      emit(GetCategories(result));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  getSubCategories(String prodId) async {
    try {
      if (!await isConnected()) {
        emit(ErrorState('Please Check Your NetWork Connection'));
        return;
      }
      emit(LoadingStateSubCategories());
      final result = await productUploadRepo.getSubCategories(prodId);
      emit(GetSubCategories(result));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  getBrands(String id) async {
    try {
      if (!await isConnected()) {
        emit(ErrorState('Please Check Your NetWork Connection'));
        return;
      }
      emit(LoadingStateBrand());
      final result = await productUploadRepo.getBrand(id);
      emit(GetBrandState(result));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  uploadProduct( Map<dynamic,dynamic> data) async {
    try {
      if (!await isConnected()) {
        emit(ErrorState('Please Check Your NetWork Connection'));
        return;
      }
       emit(LoadingStateProduct());
      final result = await productUploadRepo.uploadProducts(data);
      emit(Success(result));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  uploadProductAsMember( Map<dynamic,dynamic> data) async {
    try {
      if (!await isConnected()) {
        emit(ErrorState('Please Check Your NetWork Connection'));
        return;
      }
      emit(LoadingStateProduct());
      final result = await productUploadRepo.memberUplaodProducts(data);
        emit(Success(result));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
