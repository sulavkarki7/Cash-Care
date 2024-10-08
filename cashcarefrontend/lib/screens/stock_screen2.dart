import 'package:cashcarefrontend/controllers/budget/asset_controller.dart';
import 'package:cashcarefrontend/controllers/stocks/stock_search_controller.dart';
import 'package:cashcarefrontend/data/stock_search_result.dart';
import 'package:cashcarefrontend/screens/stock_detail.dart';
import 'package:cashcarefrontend/theme/theme_constant.dart';
import 'package:cashcarefrontend/utils/cards/stock_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = StockController();
    return Theme(
      data: myTheme,
      child: Scaffold(
        body: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  "Stocks",
                  style: TextStyle(fontSize: 26.0),
                  textAlign: TextAlign.center,
                )),
                Icon(Icons.search)
              ],
            ),
            //Container(
            //  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            //  decoration: BoxDecoration(
            //    borderRadius: BorderRadius.circular(10),
            //    boxShadow: [
            //      BoxShadow(
            //        color: Colors.grey[800]!,
            //        spreadRadius: 2,
            //        blurRadius: 10,
            //        offset: Offset(0, 3),
            //      ),
            //    ],
            //    gradient: LinearGradient(
            //      colors: [Color(0xFFF9603E), Color(0xFFE86C51)],
            //      begin: Alignment.topLeft,
            //      end: Alignment.bottomRight,
            //    ),
            //  ),
            //  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            //child: Row(
            //  children: [
            //    Icon(
            //      Icons.whatshot,
            //      color: Colors.white,
            //      size: 30,
            //    ),
            //    SizedBox(width: 10),
            //Text(
            //  "Hot Stocks",
            //  style: TextStyle(
            //    fontSize: 25,
            //    fontWeight: FontWeight.bold,
            //    color: Colors.white,
            //  ),
            //    //),
            //  ],
            //),
            //),
            Expanded(
              child: ListView.builder(
                itemCount: StockData.hotStock.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: StockCard(stock: StockData.hotStock[index]),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            onPressed: () => {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            onChanged: (value) {
                              controller.onChange(value);
                            },
                            controller: controller.searchQuery,
                            style: TextStyle(color: Colors.white), // Text color
                            decoration: InputDecoration(
                              labelText: "Search for stock",
                              labelStyle:
                                  TextStyle(color: Colors.white), // Label color
                              prefixIcon: Icon(Icons.search,
                                  color: Colors.white), // Icon color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.white), // Border color
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Suggestions:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Text color
                            ),
                          ),
                          SizedBox(height: 10),
                          Obx(
                            () {
                              return Expanded(
                                  child: ListView.builder(
                                itemCount: StockData.searchList.length,
                                itemBuilder: (context, index) {
                                  final suggestion =
                                      StockData.searchList[index];
                                  return ListTile(
                                    title: Text(
                                      suggestion.name,
                                      style: TextStyle(
                                          color: Colors.black), // Text color
                                    ),
                                    onTap: () {
                                      Get.to(StockDetail(
                                        stock: suggestion,
                                      ));
                                      // Handle selection of suggestion
                                    },
                                  );
                                },
                              ));
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            },
            child: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
