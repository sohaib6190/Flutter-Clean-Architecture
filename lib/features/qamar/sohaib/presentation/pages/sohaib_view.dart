import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/sohaib_bloc.dart';
import '../blocs/sohaib_event.dart';
import '../blocs/sohaib_state.dart';

class SohaibPage extends StatefulWidget {
  const SohaibPage({super.key});

  @override
  State<SohaibPage> createState() => _SohaibPageState();
}

class _SohaibPageState extends State<SohaibPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data on init
    // context.read<SohaibBloc>().add(SohaibFetchEvent(yourParams));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sohaib'),
      ),
      body: BlocConsumer<SohaibBloc, SohaibState>(
        listener: (context, state) {
          if (state is SohaibStateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is SohaibStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SohaibStateSuccess) {
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
