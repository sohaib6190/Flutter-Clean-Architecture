import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchableMultiSelectDialog extends StatefulWidget {
  final List<OptionItem> options;
  final List<String>? initialSelected;

  const SearchableMultiSelectDialog({
    super.key,
    required this.options,
    this.initialSelected,
  });

  static Future<List<String>?> show(
    BuildContext context,
    List<OptionItem> options, {
    List<String>? initialSelected,
  }) async {
    return showDialog<List<String>?>(
      context: context,
      builder:
          (context) => SearchableMultiSelectDialog(
            options: options,
            initialSelected: initialSelected,
          ),
    );
  }

  @override
  // ignore: library_private_types_in_public_api
  _SearchableMultiSelectDialogState createState() =>
      _SearchableMultiSelectDialogState();
}

class _SearchableMultiSelectDialogState
    extends State<SearchableMultiSelectDialog> {
  List<String> selectedItems = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    selectedItems = widget.initialSelected ?? [];
  }

  @override
  Widget build(BuildContext context) {
    List<OptionItem> filteredOptions =
        widget.options
            .where(
              (option) => option.label.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ),
            )
            .toList();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.9.sw,
          maxHeight: 0.7.sh,
          minHeight: 0.4.sh,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select Options",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() => searchQuery = value);
                },
              ),
              const SizedBox(height: 10),
              Expanded(child: _listView(filteredOptions)), // Scrollable list
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, null),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, selectedItems),
                    child: const Text("Done"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listView(List<OptionItem> filteredOptions) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredOptions.length,
      itemBuilder: (context, index) {
        final item = filteredOptions[index];
        final isSelected = selectedItems.contains(item.value);
        return ListTile(
          title: Text(item.label),
          leading: Checkbox(
            value: isSelected,
            onChanged: (bool? value) {
              setState(() {
                if (value == true) {
                  selectedItems.add(item.value);
                } else {
                  selectedItems.remove(item.value);
                }
              });
            },
          ),
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedItems.remove(item.value);
              } else {
                selectedItems.add(item.value);
              }
            });
          },
        );
      },
    );
  }
}

class OptionItem {
  final String label;
  final String value;
  final IconData icon;

  OptionItem({required this.label, required this.value, required this.icon});
}
