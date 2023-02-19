import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:product_showcase/cubit/product_cubit.dart';
import 'package:product_showcase/screens/product_details_page.dart';

import '../models/product_model.dart';
import '../repos/product_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productRepo = ProductRepo();

  final scrollController = ScrollController();

  void setupScroll(context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels != 0) {
        BlocProvider.of<ProductCubit>(context).loadPosts();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = BlocProvider.of<ProductCubit>(context);

      cubit.loadPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial || state is LoadingProductInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // else if (state is ResponseProductInitial) {
          //   final product = state.productModel;

          List<ProductModel> posts = [];

          if (state is LoadedProductInitial) {
            posts = state.oldProductModel;
          } else if (state is ResponseProductInitial) {
            posts = state.productModel;
          }

          return GridView.builder(
            itemCount: posts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemBuilder: (context, index) {
              return GridView.builder(
                  controller: scrollController,
                  itemCount: posts[index].data.products.results.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemBuilder: (context, index1) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProductDetailsPage(
                              slug: posts[index]
                                  .data
                                  .products
                                  .results[index1]
                                  .slug,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                posts[index]
                                    .data
                                    .products
                                    .results[index1]
                                    .image,
                                height: MediaQuery.of(context).size.height * .3,
                                width: MediaQuery.of(context).size.width * .3,
                              ),
                              Expanded(
                                child: Text(
                                  posts[index]
                                      .data
                                      .products
                                      .results[index1]
                                      .productName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.notoSansBengali(),
                                ),
                              ),
                              Text(
                                'buy: ${posts[index].data.products.results[index1].charge.currentCharge.toString()}',
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'sell: ${posts[index].data.products.results[index1].charge.sellingPrice.toString()}',
                                  ),
                                  Text(
                                    'gain: ${(posts[index].data.products.results[index1].charge.sellingPrice - posts[index].data.products.results[index1].charge.currentCharge)}'
                                        .toString(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
          );

          // } else if (state is ErrorProductInitial) {
          //   return Text(state.errors);
          // } else {
          //   return Text(
          //     state.toString(),
          //   );
          // }
          // return Column(
          //   children: [
          //     Expanded(
          //       child: FutureBuilder(
          //         future: productRepo.getProducts(),
          //         builder: (context, snapshot) {
          //           if (!snapshot.hasData) {
          //             return const Center(
          //               child: CircularProgressIndicator(),
          //             );
          //           } else if (snapshot.hasData) {
          //             return GridView.builder(
          //               itemCount: snapshot.data!.data.products.results.length,
          //               gridDelegate:
          //                   const SliverGridDelegateWithFixedCrossAxisCount(
          //                 crossAxisCount: 2,
          //                 crossAxisSpacing: 4.0,
          //                 mainAxisSpacing: 4.0,
          //               ),
          //               itemBuilder: (context, index) {
          //                 return Container(
          //                   padding: const EdgeInsets.all(8),
          //                   height: MediaQuery.of(context).size.height * .65,
          //                   child: Card(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         ImageNetwork(
          //                           image: snapshot.data!.data.products
          //                               .results[index].image,
          //                           height:
          //                               MediaQuery.of(context).size.height * .2,
          //                           width:
          //                               MediaQuery.of(context).size.width * .2,
          //                         ),
          //                         Text(
          //                           snapshot.data!.data.products.results[index]
          //                               .productName,
          //                           overflow: TextOverflow.fade,
          //                           style: GoogleFonts.notoSansBengali(),
          //                         ),
          //                         Text(
          //                           'buy: ${snapshot.data!.data.products.results[index].charge.currentCharge.toString()}',
          //                         ),
          //                         Row(
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Text(
          //                               'sell: ${snapshot.data!.data.products.results[index].charge.sellingPrice.toString()}',
          //                             ),
          //                             Text(
          //                               'gain: ${(snapshot.data!.data.products.results[index].charge.sellingPrice - snapshot.data!.data.products.results[index].charge.currentCharge)}'
          //                                   .toString(),
          //                             ),
          //                           ],
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                 );
          //               },
          //             );
          //           } else {
          //             return const Text('there are some errors');
          //           }
          //         },
          //       ),
          //     ),
          //   ],
          // );
        },
      ),
    );
  }
}
