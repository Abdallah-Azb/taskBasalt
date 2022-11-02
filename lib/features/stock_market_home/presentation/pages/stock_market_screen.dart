import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_basalt/features/stock_market_home/domain/entities/stock.market_entity_request.dart';
import 'package:task_basalt/features/stock_market_home/presentation/manager/stock.market_controller.dart';
import 'package:task_basalt/widgets/empty_data/empty_data_list.dart';
import 'package:task_basalt/widgets/error/error.dart';
import 'package:task_basalt/widgets/loading/loading_widget.dart';

class StockMarketScreen extends StatefulWidget {
  // final String? symbol;

  const StockMarketScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StockMarketScreen> createState() => _StockMarketScreenState();
}

class _StockMarketScreenState extends State<StockMarketScreen> {
  @override
  Widget build(BuildContext context) {
    final String x = Get.arguments as String;
    //print("x" + x.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Market Entity of $x'),
        centerTitle: true,
      ),
      body: GetBuilder<StockMarketController>(
        builder: (controller) {
          if (controller.loading) {
            return const AppLoading();
          } else if (controller.hasError) {
            return const AppError();
          } else if (controller.stockMarketList.isEmpty && !controller.loading && !controller.hasError) {
            return const AppEmpty();
          } else {
            return GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1.2),
                itemCount: controller.stockMarketList.length,
                itemBuilder: (context, index) => _card(controller.stockMarketList[index]));
          }
        },
      ),
    );
  }

  Widget _card(StockMarketEntity company) {
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
                    'Stock Market Info',
                    style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(child: _rowInfo(des: 'Open ', title: company.open.toString())),
                      Expanded(child: _rowInfo(des: 'Close ', title: company.close.toString())),
                    ],
                  ),
                  //
                  Row(
                    children: [
                      Expanded(child: _rowInfo(des: 'Adj Open ', title: company.adjOpen.toString())),
                      Expanded(child: _rowInfo(des: 'Adj Close ', title: company.adjClose.toString())),
                    ],
                  ),
                  //
                  Row(
                    children: [
                      Expanded(child: _rowInfo(des: 'High', title: company.high.toString())),
                      Expanded(child: _rowInfo(des: 'low ', title: company.low.toString())),
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(child: _rowInfo(des: 'Adj High', title: company.adjHigh.toString())),
                      Expanded(child: _rowInfo(des: 'Adj Low ', title: company.adjLow.toString())),
                    ],
                  ),
                  _rowInfo(des: 'volume ', title: company.volume.toString()),
                  _rowInfo(des: 'Adj volume ', title: company.adjVolume.toString()),
                  _rowInfo(des: 'Exchange ', title: company.exchange.toString()),
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

  @override
  void initState() {
    super.initState();
    Get.find<StockMarketController>().fetchDataStockMarket(symbol: Get.arguments as String);
  }
}
