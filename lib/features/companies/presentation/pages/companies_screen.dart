import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_basalt/core/navigation/routes.dart';
import 'package:task_basalt/features/companies/domain/entities/company_entity.dart';
import 'package:task_basalt/features/companies/presentation/manager/companies_controller.dart';
import 'package:task_basalt/features/stock_market_home/presentation/pages/stock_market_screen.dart';
import 'package:task_basalt/widgets/empty_data/empty_data_list.dart';
import 'package:task_basalt/widgets/error/error.dart';
import 'package:task_basalt/widgets/loading/loading_widget.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies'),
        centerTitle: true,
      ),
      body: GetBuilder<CompaniesController>(
        builder: (controller) {
          if (controller.loading) {
            return const AppLoading();
          } else if (controller.hasError) {
            return const AppError();
          } else if (controller.companiesList.isEmpty && !controller.loading && !controller.hasError) {
            return const AppEmpty();
          } else {
            return GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.2),
                itemCount: controller.companiesList.length,
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      // Get.to(StockMarketScreen(symbol:controller.companiesList[index].symbol ,));
                      Get.toNamed(Routes.StockMarket, arguments: controller.companiesList[index].symbol);
                    },
                    child: _card(controller.companiesList[index])));
          }
        },
      ),
    );
  }

  Widget _card(CompanyEntity company) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Card(
            color: Colors.grey.shade100,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Company Info',
                    style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _rowInfo(des: 'Name ', title: company.name.toString()),
                  _rowInfo(des: 'Symbol ', title: company.symbol.toString()),
                  _rowInfo(des: 'Has Intra Day ', title: company.hasIntraday.toString()),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Stock Exchange',
                    style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _rowInfo(des: 'Name ', title: company.stockExchange!.name.toString()),
                  _rowInfo(des: 'Acronym ', title: company.stockExchange!.acronym.toString()),
                  _rowInfo(des: 'MIC ', title: company.stockExchange!.mic.toString()),
                  _rowInfo(des: 'Country ', title: company.stockExchange!.country.toString()),
                  _rowInfo(des: 'City ', title: company.stockExchange!.city.toString()),
                  _rowInfo(des: 'Website ', title: company.stockExchange!.website.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _rowInfo({required String des, required String title}) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text("$des : ")),
        Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w600),
            )),
      ],
    );
  }
}
