import 'package:flutter/material.dart';

import '../constants/app_palette.dart';


class CustomTabSelector extends StatelessWidget {
  final int selectedIndex;
  final List<String> tabTitles;
  final Function(int) onTabSelected;

  const CustomTabSelector({
    super.key,
    required this.selectedIndex,
    required this.tabTitles,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        // color: const Color(0xFFF5F8FC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: List.generate(tabTitles.length, (index) {
          final isSelected = index == selectedIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: Container(
                height: 40,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFE3F2FD) : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:
                        isSelected
                            ? AppPalette.primaryColor
                            : AppPalette.greyColor,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  tabTitles[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color:
                        isSelected
                            ? AppPalette.primaryColor
                            : AppPalette.greyColor,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
