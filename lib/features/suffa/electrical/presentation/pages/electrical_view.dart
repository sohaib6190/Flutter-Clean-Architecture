import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/electrical_bloc.dart';
import '../blocs/electrical_event.dart';
import '../blocs/electrical_state.dart';

class ElectricalPage extends StatefulWidget {
  const ElectricalPage({super.key});

  @override
  State<ElectricalPage> createState() => _ElectricalPageState();
}

class _ElectricalPageState extends State<ElectricalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electrical'),
      ),
      body: BlocConsumer<ElectricalBloc, ElectricalState>(
        listener: (context, state) {
          if (state is ElectricalStateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Success!')),
            );
          } else if (state is ElectricalStateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is ElectricalStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add your UI widgets here
                const Text('Electrical Page'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Example: Trigger submit event
                    // context.read<ElectricalBloc>().add(
                    //   ElectricalSubmitEvent(yourData),
                    // );
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

