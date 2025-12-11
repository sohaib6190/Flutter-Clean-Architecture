import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/request/product_add_params.dart';
import '../blocs/product_add_bloc.dart';
import '../blocs/product_add_event.dart';
import '../blocs/product_add_state.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductAdding'),
      ),
      body: BlocConsumer<ProductAddBloc, ProductAddState>(
        listener: (context, state) {
          if (state is ProductAddStateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Success!')),
            );
          } else if (state is ProductAddStateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductAddStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add your UI widgets here
                const Text('ProductAdd Page'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<ProductAddBloc>().add(
                      ProductAddSubmitEvent(
                        ProductAddParams(
                          title: 'Product Title',
                          userId: 1,
                        ),
                      ),
                    );
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

