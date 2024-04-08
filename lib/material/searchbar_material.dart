import 'package:flutter/material.dart';

class SearchBarMaterial extends StatefulWidget {
  const SearchBarMaterial({super.key});

  @override
  State<SearchBarMaterial> createState() => _SearchBarMaterialState();
}

class _SearchBarMaterialState extends State<SearchBarMaterial> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, controller) {
        return SearchBar(
          leading: const Icon(Icons.search),
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          controller: controller,
          // onTap: () => controller.openView(),
          // onChanged: (_) => controller.openView(),
          hintText: 'Cari hotel',
          onSubmitted: (String value) {},
          elevation: const MaterialStatePropertyAll<double>(1.0),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(
                width: 0.5,
              ),
            ),
          ),
        );
      },
      suggestionsBuilder: (context, controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      },
    );
  }
}
