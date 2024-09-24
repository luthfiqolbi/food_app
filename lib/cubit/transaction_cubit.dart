import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/model/models.dart';
import 'package:food_app/service/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransaction() async {
    ApiReturnValue<List<Transaction>> result = await TransactionServices.getTransaction();

    if (result.value != null){
      emit(TransactionLoaded(result.value!.cast<Transition>()));
    }else{
      emit(TransactionLoadingFailed(result.message!));
    }
  }

  Future<void> submitTransaction(Transaction transaction) async {
    ApiReturnValue<List<Transaction>> result = await TransactionServices.submitTransaction(transaction);

    if (result.value != null){
      emit(TransactionLoaded(result.value!.cast<Transition>()));
    }else{
      emit(TransactionLoadingFailed(result.message!));
    }
  }
}