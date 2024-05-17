import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:minimal_rest/minimal_rest.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_project/domain/core/entities/failure.dart';
import 'package:starter_project/domain/core/entities/rest_response.dart';
import 'package:starter_project/domain/entities/git_repository_info.dart';
import 'package:starter_project/domain/repositories/repository_info.repository.dart';

import '../models/git_repository_info.model.dart';

class GithubRepositoryInfoRepositoryImpl implements RepositoryInfoRepository {

  final SharedPreferences _sharedPreferences;

  GithubRepositoryInfoRepositoryImpl(this._sharedPreferences);


  //region static vars
  static const String _cachedTopStargazersPrefKey = "cachedTopStargazers";
  //endregion

  @override
  Future<Either<Failure, RestResponse<GitRepositoryInfo>>> getTopStargazers({
    int pageNumber = 1,
    int perPage = 20,
  }) async {
    Either<MinRestError, RestResponse<GitRepositoryInfo>> result =
        await MinRest().getErrorOr(
      "/search/repositories?q=Flutter&sort=stars&order=desc&page=$pageNumber&per_page=$perPage",
      (json) => RestResponse<GitRepositoryInfo>.fromJson(
        json,
        (json) => GitRepositoryInfoModel.fromJson(json),
      ),
    );
    return result.fold(
      (error) => Left(
          Failure("Failed to Fetch Data", "${error.message} (${error.code})")),
      (response) => Right(response),
    );
  }

  @override
  Future<Either<Failure, Unit>> cacheTopStargazers(List<GitRepositoryInfo> gitRepos) async {
    bool isCached = await _sharedPreferences.setString(
      _cachedTopStargazersPrefKey,
      jsonEncode(gitRepos
          .map((item) => GitRepositoryInfoModel.fromEntity(item).toJson())
          .toList()),
    );
    if (isCached) {
      return right(unit);
    } else {
      return left(Failure("Caching Failed", "Failed to cache Repos"));
    }
  }

  @override
  Future<Either<Failure, List<GitRepositoryInfo>>> getCachedTopStargazers() {
    String? repos = _sharedPreferences.getString(_cachedTopStargazersPrefKey);
    if (repos == null) {
      return Future.value(left(Failure("Failed", "Failed to retrieve cached repos")));
    }
    dynamic cachedRepos = jsonDecode(repos);
    print("Decoding");
    print(repos);
    return Future.value(
      right(cachedRepos
          .map<GitRepositoryInfo>((item) => GitRepositoryInfoModel.fromJson(item))
          .toList()),
    );
  }
}
