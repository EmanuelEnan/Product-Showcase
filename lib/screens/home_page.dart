import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:product_showcase/cubit/product_cubit.dart';

import '../repos/product_repo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productRepo = ProductRepo();
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return Column(
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
                      return GridView.builder(
                        itemCount: snapshot.data!.data.products.results.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * .65,
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ImageNetwork(
                                    image: snapshot.data!.data.products
                                        .results[index].image,
                                    height:
                                        MediaQuery.of(context).size.height * .2,
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                  ),
                                  Text(
                                    snapshot.data!.data.products.results[index]
                                        .productName,
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.notoSansBengali(),
                                  ),
                                  Text(
                                    'buy: ${snapshot.data!.data.products.results[index].charge.currentCharge.toString()}',
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'sell: ${snapshot.data!.data.products.results[index].charge.sellingPrice.toString()}',
                                      ),
                                      Text(
                                        'gain: ${(snapshot.data!.data.products.results[index].charge.sellingPrice - snapshot.data!.data.products.results[index].charge.currentCharge)}'
                                            .toString(),
                                      ),
                                    ],
                                  )
                                ],
                              ),
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
          );
        },
      ),
    );
  }
}
