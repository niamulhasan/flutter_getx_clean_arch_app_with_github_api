import 'package:dartz/dartz.dart';
import 'package:minimal_rest/minimal_rest.dart';
import 'package:starter_project/domain/core/entities/failure.dart';
import 'package:starter_project/domain/core/entities/rest_response.dart';
import 'package:starter_project/domain/entities/git_repository_info.dart';
import 'package:starter_project/domain/repositories/repository_info.repository.dart';

import '../models/git_repository_info.model.dart';

class GithubRepositoryInfoRepositoryImpl implements RepositoryInfoRepository {
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
}
