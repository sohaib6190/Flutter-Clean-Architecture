import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/handle_bloc.dart';
import '../blocs/handle_event.dart';
import '../blocs/handle_state.dart';

class HandlePage extends StatefulWidget {
  const HandlePage({super.key});

  @override
  State<HandlePage> createState() => _HandlePageState();
}

class _HandlePageState extends State<HandlePage> {
  @override
  void initState() {
    super.initState();
    // Fetch data on init
    // context.read<HandleBloc>().add(HandleFetchEvent(yourParams));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handle'),
      ),
      body: BlocConsumer<HandleBloc, HandleState>(
        listener: (context, state) {
          if (state is HandleStateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is HandleStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HandleStateSuccess) {
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
