import 'package:dartz/dartz.dart';
import 'package:starter_project/domain/core/entities/failure.dart';
import 'package:starter_project/domain/core/entities/rest_response.dart';
import 'package:starter_project/domain/entities/git_repository_info.dart';

abstract interface class RepositoryInfoRepository {
  Future<Either<Failure, RestResponse<GitRepositoryInfo>>> getTopStargazers({
    int pageNumber = 1,
    int perPage = 20,
  });

  Future<Either<Failure, Unit>> cacheTopStargazers(List<GitRepositoryInfo> gitRepos);
  Future<Either<Failure, List<GitRepositoryInfo>>> getCachedTopStargazers();
}
