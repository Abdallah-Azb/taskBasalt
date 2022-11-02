import 'package:get/get.dart';
import 'package:task_basalt/features/companies/domain/entities/company_entity.dart';
import 'package:task_basalt/features/companies/domain/repositories/companies_repositories.dart';
import 'package:task_basalt/widgets/snackbar/snackbar_app.dart';

class CompaniesController extends GetxController {
  final CompanyRepository repository;

  CompaniesController({required this.repository});

  @override
  void onClose() {}

  @override
  void onInit() {
    super.onInit();
    fetchDataCompanies();
  }

  //
  bool loading = false;

  updateLoading(bool val) {
    loading = val;
    update();
  }

  //
  bool hasError = false;

  updateHasError(bool val) {
    hasError = val;
    update();
    //
  }

  List<CompanyEntity> companiesList = [];

  //
  fetchDataCompanies() async {
    updateLoading(true);
    updateHasError(false);
    try {
      final response = await repository.fetchData();
      response.fold((l) {
        AppSnackBar().error(message: l.cause.toString(), title: l.response.toString());
        print(l.response!.data.toString());
        updateHasError(true);

        return null;
      }, (r) {
        companiesList.addAll(r);
        update();
        // AppSnackBar().success(title: r[0].date.toString(), message: r[0].exchange.toString());
      });
    } catch (e) {
      AppSnackBar().error(title: 'Exception ', message: e.toString());
      updateHasError(true);
    }
    updateLoading(false);
  }
}
