import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/app/components/custom_toast.dart';
import 'package:flutter_clean_architecture/app/constants/app_palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/request/product_listing_params.dart';
import '../blocs/product_listing_bloc.dart';
import '../blocs/product_listing_event.dart';
import '../blocs/product_listing_state.dart';


class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data on init
    context.read<ProductListingBloc>().add(ProductListingFetchEvent(ProductListingParams()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductListings'),
      ),
      body: BlocConsumer<ProductListingBloc, ProductListingState>(
        listener: (context, state) {
          if (state is ProductListingStateFailure) {
          CustomToast.error(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is ProductListingStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductListingStateSuccess) {
            // Flatten all products from all carts
            final allProducts = state.data.carts?.expand((cart) => cart.products ?? []).toList() ?? [];
            // Display your data here
            return ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
             
              itemCount: allProducts.length,
              itemBuilder: (context, index) {
          
                final item = allProducts[index];
                return _buildSuccessWidget(
                  item?.title ?? ''
                );
              },
              separatorBuilder: (context, index) => 10.verticalSpace,
            );
          }

          return const Center(
            child: Text('No data available'),
          );
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessWidget(String productName) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 44,horizontal: 16),
      color: AppPalette.d5Color,
      child: Text(
        "Product Name : $productName"

      )
    );
  }
}
