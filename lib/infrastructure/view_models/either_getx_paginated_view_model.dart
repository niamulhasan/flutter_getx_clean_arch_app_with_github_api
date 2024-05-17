import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_union_view_model_state.enum.dart';

class GetxUnionPaginatedViewModel<E, T, I> {
  /// [E] returns on failure
  ///
  /// [T] is the expected type ([Wrapper] class)
  ///
  /// [I] is the type of the [Items] in the list so that [T<I>] can be used
  /// Where [T] has a [List<I>] as a property
  GetxUnionPaginatedViewModel();

  final _data = Rxn<T>();

  T get data => _data.value as T;

  final _items = <I>[].obs;

  List<I> get items => _items;

  final _error = Rxn<E>();

  E get error => _error.value as E;

  final _viewState = GetxUnionViewModelState.loading.obs;

  GetxUnionViewModelState get viewState => _viewState.value;

  final _hasCachedData = false.obs;
  bool get hasCachedData => _hasCachedData.value;

  Future<Either<E, T>> Function(int pageNo)? _fetcher;
  Future<Either<E, Unit>> Function(T data)? _cacher;
  Future<Either<E, List<I>>> Function()? _cacheRetriever;

  int _pageNo = 1;

  List<I> Function(T wrapper, List<I> item)? _itemAssignerToWrapper;
  int Function(T wrapper)? _lastPageNoSetter;
  int? _lastPageNo;

  /// [fetcher] called to fetch initial data
  /// [onNextPageLoad] called to assign items to the displayed list
  ///
  /// New items are in [wrapper.data] and the old items are in [items]
  ///
  /// Example
  /// ```
  /// (wrapper, items) => items..addAll(wrapper.data)
  /// ```
  /// To show appended items
  /// ```
  /// (wrapper, items) => wrapper.data
  /// ```
  /// To show only the items from the wrapper
  /// [fetchInstantly] if true then [fetch] will be called
  /// [initialPageNo] is the page number to fetch
  /// [lastPageNo] is the last page number to fetch
  /// if [lastPageNo] is null then [fetchNext] will be kept calling
  Future<void> setFetcher({
    required Future<Either<E, T>> Function(int pageNo) fetcher,
    required List<I> Function(T wrapper, List<I> previousItems)? onNextPageLoad,
    bool fetchInstantly = false,
    int initialPageNo = 1,
    int Function(T wrapper)? lastPageNoSetter,
    Future<Either<E, Unit>> Function(T data)? cacher,
    Future<Either<E, List<I>>> Function()? cacheRetriever,
    bool cacheInstantly = false,
  }) async {
    assert(fetcher != onNextPageLoad);
    _pageNo = initialPageNo;
    _fetcher = fetcher;
    _cacher = cacher;
    _itemAssignerToWrapper = onNextPageLoad;
    _lastPageNoSetter = lastPageNoSetter;

    _cacheRetriever = cacheRetriever;
    if(_cacheRetriever != null) retrieveCache();
    if (fetchInstantly) await fetch();
    if (cacheInstantly) cache();
  }

  Future<void> fetch() async {
    assert(_fetcher != null);
    _viewState.value = GetxUnionViewModelState.loading;
    final result = await _fetcher!(_pageNo);
    result.fold((l) {
      _error.value = l;
      _viewState.value = GetxUnionViewModelState.error;
    }, (r) {
      if (r == null) {
        _viewState.value = GetxUnionViewModelState.empty;
        return;
      }
      _data.value = r;
      _items.clear();
      _items.value = _itemAssignerToWrapper!(r, _items.value);
      if (_lastPageNoSetter != null) {
        _lastPageNo = _lastPageNoSetter!(r);
      }
      if (_items.isEmpty) {
        _viewState.value = GetxUnionViewModelState.empty;
        return;
      }
      _viewState.value = GetxUnionViewModelState.data;
    });
  }

  /// if [pageNo] is null then the next page will be fetched
  /// [pageNo] is the page number to fetch
  Future<void> fetchNext([int? pageNo]) async {
    assert(_fetcher != null);
    if (_lastPageNo != null && _pageNo >= _lastPageNo!) {
      log('No more pages to fetch');
      return;
    }
    _viewState.value = GetxUnionViewModelState.loadingMore;
    final result = await _fetcher!(pageNo ?? _pageNo + 1);
    _pageNo = pageNo ?? _pageNo + 1;
    result.fold((l) {
      _error.value = l;
      _viewState.value = GetxUnionViewModelState.error;
    }, (r) {
      if (r == null) {
        _viewState.value = GetxUnionViewModelState.empty;
        return;
      }
      _data.value = r;
      _itemAssignerToWrapper!(r, _items.value);
      _viewState.value = GetxUnionViewModelState.data;
    });
  }

  //region caching mechanism
  Future<void> cache() async {
    debugPrint("Caching");
    if (_cacher == null) {
      log("cacher is null. Have you forgotten to set it?");
      return;
    }
    if (_data.value == null) {
      log("Got null Data while caching. Have you forgotten to fetch it?");
      return;
    }
    final result = await _cacher!(data);
    result.fold((l) {
      log("Error caching data: $l");
    }, (r) {
      log("Data cached successfully");
    });
  }

  Future<void> retrieveCache() async {
    if (_cacheRetriever == null) {
      log("cacheRetriever is null. Have you forgotten to set it?");
      return;
    }
    final result = await _cacheRetriever!();
    result.fold((l) {
      log("Error retrieving cache: $l");
    }, (r) {
      // _data.value = r;
      _items.value = r;
      _hasCachedData.value = true;
    });
  }
  //endregion

  //fold
  Obx fold({
    required Widget onLoading,
    required Widget onEmpty,
    required Widget Function(E error) onError,
    required Widget Function(List<I> data) onData,
    required Widget onLoadingMore,
  }) {
    return Obx(() {
      return Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(microseconds: 900),
            child: viewState == GetxUnionViewModelState.loading
                ? onLoading
                : viewState == GetxUnionViewModelState.error
                    ? onError(error)
                    : viewState == GetxUnionViewModelState.data ||
                            viewState == GetxUnionViewModelState.loadingMore
                        ? onData(_items.value)
                        : onEmpty,
          ),
          if (viewState == GetxUnionViewModelState.loadingMore) onLoadingMore
        ],
      );
    });
  }
}
