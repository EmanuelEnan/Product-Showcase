import 'package:flutter/material.dart';

import '../repos/product_repo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productRepo = ProductRepo();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: productRepo.getProducts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.data.products.results.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Text(
                              snapshot.data!.data.products.results[index].slug,
                            ),
                            Text(
                              snapshot.data!.data.products.results[index]
                                  .productName,
                            ),
                            Text(
                              snapshot
                                  .data!.data.products.results[index].seller,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Text('there are some errors');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
