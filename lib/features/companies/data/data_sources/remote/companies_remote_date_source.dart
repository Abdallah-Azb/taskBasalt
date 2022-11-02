import 'package:dartz/dartz.dart';
import 'package:task_basalt/core/exception/custom_exceptoin.dart';
import 'package:task_basalt/features/companies/data/models/company_model.dart';

abstract class CompaniesRemoteDateSource {

  Future<Either<CustomException, List<CompanyModel>>> fetchData();

}
