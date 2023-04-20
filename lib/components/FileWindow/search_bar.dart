import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:os_file/components/c_icon_button.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = AdaptiveTheme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      height: 30,
      decoration: BoxDecoration(
        color: isDark
            ? AdaptiveTheme.of(context)
                .theme
                .colorScheme
                .primary
                .withOpacity(0.2)
            : AdaptiveTheme.of(context)
                .theme
                .colorScheme
                .onPrimaryContainer
                .withOpacity(0.4),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          const Icon(
            Icons.search,
            size: 16,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: SizedBox(
              height: 20,
              child: TextFormField(
                style: const TextStyle(fontSize: 12),
                decoration: const InputDecoration(
                  hintText: "Search in this folder",
                  hintStyle: TextStyle(fontSize: 12, height: 0.08),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          // Text(
          //   "Search in this Folder",
          //   style: AdaptiveTheme.of(context)
          //       .theme
          //       .textTheme
          //       .bodySmall!
          //       .copyWith(fontSize: 12),
          // ),
          CustomIconButton(
            icon: Icons.sort,
            onPressed: () {},
            splashRadius: 10,
            size: 16,
          ),
        ],
      ),
    );
  }
}
