import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/test_feature_bloc.dart';
import '../blocs/test_feature_event.dart';
import '../blocs/test_feature_state.dart';

class TestFeaturePage extends StatefulWidget {
  const TestFeaturePage({super.key});

  @override
  State<TestFeaturePage> createState() => _TestFeaturePageState();
}

class _TestFeaturePageState extends State<TestFeaturePage> {
  @override
  void initState() {
    super.initState();
    // Fetch data on init
    // context.read<TestFeatureBloc>().add(TestFeatureFetchEvent(yourParams));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestFeature'),
      ),
      body: BlocConsumer<TestFeatureBloc, TestFeatureState>(
        listener: (context, state) {
          if (state is TestFeatureStateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is TestFeatureStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TestFeatureStateSuccess) {
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
