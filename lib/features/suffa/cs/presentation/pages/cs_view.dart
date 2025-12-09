import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cs_bloc.dart';
import '../blocs/cs_event.dart';
import '../blocs/cs_state.dart';

class CsPage extends StatefulWidget {
  const CsPage({super.key});

  @override
  State<CsPage> createState() => _CsPageState();
}

class _CsPageState extends State<CsPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data on init
    // context.read<CsBloc>().add(CsFetchEvent(yourParams));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cs'),
      ),
      body: BlocConsumer<CsBloc, CsState>(
        listener: (context, state) {
          if (state is CsStateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is CsStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CsStateSuccess) {
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
