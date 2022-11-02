import 'package:get_it/get_it.dart';
import 'package:task_basalt/features/companies/data/data_sources/remote/companies_remote_date_source.dart';
import 'package:task_basalt/features/companies/data/data_sources/remote/companies_remote_date_source_imp.dart';
import 'package:task_basalt/features/companies/domain/repositories/companies_repositories.dart';
import 'package:task_basalt/features/companies/domain/repositories/companies_repositories_imp.dart';
import 'package:task_basalt/features/companies/presentation/manager/companies_controller.dart';

GetIt injectLogin = GetIt.instance;

Future<void> init() async {
  injectLogin.registerFactory(
    () => CompaniesController(
      repository: injectLogin(),
    ),
  );

  injectLogin.registerLazySingleton<CompanyRepository>(
    () => CompanyRepositoryImp(remoteDateSource: injectLogin()),
  );

  injectLogin.registerLazySingleton<CompaniesRemoteDateSource>(() => CompaniesRemoteDateSourceImp());

  // injectLogin.registerLazySingleton<LoginControllerBinding>(() => LoginControllerBinding());
}
