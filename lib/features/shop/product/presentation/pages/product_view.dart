import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/product_bloc.dart';
import '../blocs/product_event.dart';
import '../blocs/product_state.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data on init
    // context.read<ProductBloc>().add(ProductFetchEvent(yourParams));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductStateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductStateSuccess) {
            // Display your data here
            return Center(
              child: Text('Data loaded: ${state.data}'),
            );
          }

          return const Center(
            child: Text('No data available'),
          );
        },
      ),
    );
  }
}
