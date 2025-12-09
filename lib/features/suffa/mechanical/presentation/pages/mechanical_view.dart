import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/mechanical_bloc.dart';
import '../blocs/mechanical_event.dart';
import '../blocs/mechanical_state.dart';

class MechanicalPage extends StatefulWidget {
  const MechanicalPage({super.key});

  @override
  State<MechanicalPage> createState() => _MechanicalPageState();
}

class _MechanicalPageState extends State<MechanicalPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data on init
    // context.read<MechanicalBloc>().add(MechanicalFetchEvent(yourParams));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mechanical'),
      ),
      body: BlocConsumer<MechanicalBloc, MechanicalState>(
        listener: (context, state) {
          if (state is MechanicalStateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is MechanicalStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MechanicalStateSuccess) {
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
