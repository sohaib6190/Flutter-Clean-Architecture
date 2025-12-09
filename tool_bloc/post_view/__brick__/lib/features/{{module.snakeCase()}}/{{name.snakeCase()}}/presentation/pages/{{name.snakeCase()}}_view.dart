import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/{{name.snakeCase()}}_bloc.dart';
import '../blocs/{{name.snakeCase()}}_event.dart';
import '../blocs/{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Page extends StatefulWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  State<{{name.pascalCase()}}Page> createState() => _{{name.pascalCase()}}PageState();
}

class _{{name.pascalCase()}}PageState extends State<{{name.pascalCase()}}Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{name.pascalCase()}}'),
      ),
      body: BlocConsumer<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
        listener: (context, state) {
          if (state is {{name.pascalCase()}}StateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Success!')),
            );
          } else if (state is {{name.pascalCase()}}StateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is {{name.pascalCase()}}StateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add your UI widgets here
                const Text('{{name.pascalCase()}} Page'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Example: Trigger submit event
                    // context.read<{{name.pascalCase()}}Bloc>().add(
                    //   {{name.pascalCase()}}SubmitEvent(yourData),
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

