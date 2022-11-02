import 'package:dartz/dartz.dart';
import 'package:task_basalt/core/exception/custom_exceptoin.dart';
import 'package:task_basalt/features/companies/domain/entities/company_entity.dart';

abstract class CompanyRepository {
  Future<Either<CustomException, List<CompanyEntity>>> fetchData();
}
