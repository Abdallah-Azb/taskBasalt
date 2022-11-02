import 'package:dartz/dartz.dart';
import 'package:task_basalt/core/exception/custom_exceptoin.dart';
import 'package:task_basalt/core/network_services/check_internet.dart';
import 'package:task_basalt/features/companies/data/data_sources/remote/companies_remote_date_source.dart';
import 'package:task_basalt/features/companies/domain/entities/company_entity.dart';
import 'package:task_basalt/features/companies/domain/repositories/companies_repositories.dart';

class CompanyRepositoryImp implements CompanyRepository {
  final CompaniesRemoteDateSource remoteDateSource;

  CompanyRepositoryImp({required this.remoteDateSource});

  @override
  Future<Either<CustomException, List<CompanyEntity>>> fetchData() async {
    if (await checkConnectionInternet()) {
      try {
        return await remoteDateSource.fetchData();
      } catch (e) {
        return Left(CustomException(e.toString()));
      }
    } else {
      return Left(CustomException('No internet'));
    }
  }
}
