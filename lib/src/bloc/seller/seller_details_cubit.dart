import 'package:digitalkarobaar/src/bloc/seller/seller_state.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerCubit extends Cubit<SellerDetail> {
  SellerCubit(this.sellRepository) : super(SellerDetailInitialSate());

  final SellRepository sellRepository;

  getAllStates() async {
    try {
      final state = await sellRepository.getAllState();

      emit(SellerDetailLoadedState(state));
    } catch (e) {}
  }

  getAllCities(String state) async {
    try {
        emit(SellerDetailLoadingSate());
      final cities = await sellRepository.getCities(state);

      emit(LoadedCities(cities));
    } catch (e) {}
  }

  fillDetails(Map data) async {
     emit(SellerDetailLoadingSate());
    try {
     final id = await sellRepository.fillForm(data);
      emit(Success(id));
    } catch (e) {}
  }
   updateDetails(Map data) async {
     emit(SellerDetailLoadingSate());
    try {
     final id = await sellRepository.updateFormDetails(data);
      emit(SellerDetailUpdateState());
    } catch (e) {}
  }
}
