import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'getx_union_view_model_state.enum.dart';



class GetxUnionViewModel<E, T> {
  /// [E] returns on failure
  /// [T] is the expected type
  GetxUnionViewModel();

  final _data = Rxn<T>();
  T get data => _data.value as T;

  final _error = Rxn<E>();
  E get error => _error.value as E;

  final _viewState = GetxUnionViewModelState.loading.obs;
  GetxUnionViewModelState get viewState => _viewState.value;

  Future<Either<E, T>> Function()? _fetcher;

  void setFetcher({
    Future<Either<E, T>> Function()? fetcher,
    bool fetchInstantly = false,
  }) {
    //assertions
    assert(fetcher != null);
      _fetcher = fetcher;
    if (fetchInstantly) {
      fetch();
    }
  }

  Future<void> fetch() async {
    assert(_fetcher != null);
    _viewState.value = GetxUnionViewModelState.loading;
    final result = await _fetcher!();
    result.fold((l) {
      _error.value = l;
      _viewState.value = GetxUnionViewModelState.error;
    }, (r) {
      if (r == null) {
        _viewState.value = GetxUnionViewModelState.empty;
        return;
      }
      //TODO: This will not work as r is the wrapper class, figure out to verify empty list
      if (r is List && r.isEmpty) {
        _viewState.value = GetxUnionViewModelState.empty;
        return;
      }
      _data.value = r;
      _viewState.value = GetxUnionViewModelState.data;
    });
  }

  //fold
  Obx fold({required Widget onLoading,
    required Widget onEmpty,
    required Widget Function(E error) onError,
    required Widget Function(T data) onData}) {
    return Obx(() {
      return AnimatedSwitcher(
        duration: const Duration(microseconds: 900),
        child: viewState == GetxUnionViewModelState.loading
            ? onLoading
            : viewState == GetxUnionViewModelState.error
            ? onError(error)
            : viewState == GetxUnionViewModelState.data
            ? onData(data)
            : onEmpty,
      );
    });
  }
}
