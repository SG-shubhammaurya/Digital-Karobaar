
import 'package:digitalkarobaar/src/bloc/search/search_state.dart';
import 'package:digitalkarobaar/src/models/products.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeReposiitory) : super(InitialSate());
  HomeReposiitory homeReposiitory;

  searchResults(String query) async {
    emit(LoadingSate());
    try {
     // Products products = await homeReposiitory.searchProduts(query);
     // emit(SuccessfulState(products));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}