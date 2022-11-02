import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:task_basalt/core/exception/custom_exceptoin.dart';
import 'package:task_basalt/core/network_services/app_apis.dart';
import 'package:task_basalt/core/network_services/dio_helper.dart';
import 'package:task_basalt/core/network_services/response_model.dart';
import 'package:task_basalt/features/companies/data/data_sources/remote/companies_remote_date_source.dart';
import 'package:task_basalt/features/companies/data/models/company_model.dart';

class CompaniesRemoteDateSourceImp implements CompaniesRemoteDateSource {
  final ApiBaseHelper clint = ApiBaseHelper();

  final String _serverUrl = AppApi.company;

  @override
  Future<Either<CustomException, List<CompanyModel>>> fetchData() async {
    List<CompanyModel> responseDate = [];

    CustomResponse response = await clint.getHTTP(
      _serverUrl,
    );

    if (response.success == true || response.statusCode == 200) {
      var _d = json.decode(response.response.toString());

      responseDate = List.from(_d['data']).map((e) => CompanyModel.fromJson(e)).toList();

      return Right(responseDate);
    } else {
      return Left(CustomException(response.response.data.toString(), response: response.response));
    }
  }
}
