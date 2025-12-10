import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/jack_bloc.dart';
import '../blocs/jack_event.dart';
import '../blocs/jack_state.dart';

class JackPage extends StatefulWidget {
  const JackPage({super.key});

  @override
  State<JackPage> createState() => _JackPageState();
}

class _JackPageState extends State<JackPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data on init
    // context.read<JackBloc>().add(JackFetchEvent(yourParams));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jack'),
      ),
      body: BlocConsumer<JackBloc, JackState>(
        listener: (context, state) {
          if (state is JackStateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is JackStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is JackStateSuccess) {
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
