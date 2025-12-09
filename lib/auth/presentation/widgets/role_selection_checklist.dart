import 'package:flutter/material.dart';

import '../../../app/components/custom_checkbox.dart';
import '../../../app/constants/app_texts.dart';


class RoleSelectionWidget extends StatelessWidget {
  final bool isSuperUser;
  final bool isReceiver;
  final bool allowAllWhs;

  final ValueChanged<bool?> onSuperUserChanged;
  final ValueChanged<bool?> onReceiverChanged;
  final ValueChanged<bool?> onAllowAllWhsChanged;

  const RoleSelectionWidget({
    super.key,
    required this.isSuperUser,
    required this.isReceiver,
    required this.allowAllWhs,
    required this.onSuperUserChanged,
    required this.onReceiverChanged,
    required this.onAllowAllWhsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCheckbox(
          label: AppTexts.superUser,
          value: isSuperUser,
          onChanged: onSuperUserChanged,
        ),
        CustomCheckbox(
          label: AppTexts.receiver,
          value: isReceiver,
          onChanged: onReceiverChanged,
        ),
        CustomCheckbox(
          label: AppTexts.allowAllWhs,
          value: allowAllWhs,
          onChanged: onAllowAllWhsChanged,
        ),
      ],
    );
  }
}
