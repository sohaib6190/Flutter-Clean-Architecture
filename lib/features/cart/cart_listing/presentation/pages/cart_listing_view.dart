import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_listing_bloc.dart';
import '../blocs/cart_listing_event.dart';
import '../blocs/cart_listing_state.dart';

class CartListingPage extends StatefulWidget {
  const CartListingPage({super.key});

  @override
  State<CartListingPage> createState() => _CartListingPageState();
}

class _CartListingPageState extends State<CartListingPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data on init
    // context.read<CartListingBloc>().add(CartListingFetchEvent(yourParams));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartListing'),
      ),
      body: BlocConsumer<CartListingBloc, CartListingState>(
        listener: (context, state) {
          if (state is CartListingStateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is CartListingStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CartListingStateSuccess) {
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
