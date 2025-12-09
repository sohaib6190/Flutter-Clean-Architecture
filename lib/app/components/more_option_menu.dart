import 'package:flutter/material.dart';

import '../constants/app_texts.dart';



class MoreOptionsMenu extends StatelessWidget {

  final VoidCallback onEdit;
  final VoidCallback onRemove;

  const MoreOptionsMenu({
    super.key,
    required this.onEdit,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      
      iconSize: 12,
      icon: const Icon(
        Icons.more_vert,
        size: 30,
        color: Colors.black,
        weight: 2,
      ),
      onSelected: (value) {
        if (value == 'edit') {
          onEdit();
        } else if (value == 'remove') {
          onRemove();
        }
      },
      itemBuilder:
          (context) => [
            PopupMenuItem(value: 'edit', child: Text(AppTexts.edit)),
            PopupMenuItem(value: 'remove', child: Text(AppTexts.remove)),
          ],
    );
  }
}
