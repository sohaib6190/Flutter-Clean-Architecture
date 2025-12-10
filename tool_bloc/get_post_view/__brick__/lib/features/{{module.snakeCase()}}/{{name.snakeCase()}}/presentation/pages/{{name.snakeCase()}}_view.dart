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
  void initState() {
    super.initState();
    // Fetch data on init
    // context.read<{{name.pascalCase()}}Bloc>().add({{name.pascalCase()}}FetchEvent(yourParams));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{name.pascalCase()}}'),
      ),
      body: BlocConsumer<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
        listener: (context, state) {
          if (state is {{name.pascalCase()}}StateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is {{name.pascalCase()}}StateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is {{name.pascalCase()}}StateSuccess) {
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
