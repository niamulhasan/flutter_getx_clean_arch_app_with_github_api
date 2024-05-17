import 'package:get/get.dart';
import 'package:starter_project/domain/entities/git_repository_info.dart';
import 'package:starter_project/domain/repositories/repository_info.repository.dart';

import '../../../domain/core/entities/failure.dart';
import '../../../domain/core/entities/rest_response.dart';
import '../../../infrastructure/view_models/either_getx_paginated_view_model.dart';

class HomeController extends GetxController {

  final RepositoryInfoRepository _repositoryInfoRepository;

  HomeController(this._repositoryInfoRepository);

  final stargazersRepositoriesViewModel = GetxUnionPaginatedViewModel<Failure,
      RestResponse<GitRepositoryInfo>, GitRepositoryInfo>();

  @override
  void onInit() {
    super.onInit();
    _initRepositoryViewModel();
  }

  final int _repositoryItemsPerPage = 20;

  void _initRepositoryViewModel() {
    stargazersRepositoriesViewModel.setFetcher(
      fetcher: (pageNo) => _repositoryInfoRepository.getTopStargazers(
        pageNumber: pageNo,
        perPage: _repositoryItemsPerPage,
      ),
      onNextPageLoad: (wrapper, previousItems) =>
      previousItems..addAll(wrapper.items),
      lastPageNoSetter: (wrapper) => wrapper.totalCount ~/ _repositoryItemsPerPage,
      fetchInstantly: true,
      cacher: (data) => _repositoryInfoRepository.cacheTopStargazers(data.items),
      cacheRetriever: _repositoryInfoRepository.getCachedTopStargazers,
      cacheInstantly: true,
    );
  }
}
