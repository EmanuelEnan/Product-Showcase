import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:product_showcase/cubit/product_cubit.dart';
import 'package:product_showcase/screens/home_page.dart';

import '../repos/product_details_repo.dart';

class ProductDetailsPage extends StatefulWidget {
  final String slug;
  const ProductDetailsPage({super.key, required this.slug});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final detailsRepo = ProductDetailsRepo();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ProductCubit>();
    cubit.fetchProductDetails(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (route) => false);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductInitial || state is LoadingProductInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ResponseDetailsInitial) {
                  final product = state.detailsModel;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          product.data.image,
                          height: MediaQuery.of(context).size.height * .4,
                          width: MediaQuery.of(context).size.width * .4,
                        ),
                        Text(
                          product.data.productName,
                          style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              product.data.brand.name,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Buying price:',
                            ),
                            Text(
                              product.data.charge.currentCharge.toString(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Selling price:',
                            ),
                            Text(
                              product.data.charge.sellingPrice.toString(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Profit:',
                            ),
                            Text(
                              product.data.charge.profit.toString(),
                            ),
                          ],
                        ),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          product.data.description,
                        ),
                      ],
                    ),
                  );
                } else if (state is ErrorProductInitial) {
                  return Center(
                    child: Text(state.errors),
                  );
                }
                return Text(
                  state.toString(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
