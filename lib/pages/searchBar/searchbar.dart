import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/searchBar/filter.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomSearchBar extends StatelessWidget {
  final bool filter;
  final List<String> suggestions = [
    'Laptop',
    'mobile',
    'tablet',
  ];
  final TextEditingController _textEditingController = TextEditingController();

  CustomSearchBar({required this.filter, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          decoration: const BoxDecoration(
            color: Color(0xFFf3f3f3),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Center(
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _textEditingController,
                autofocus: false,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  border: InputBorder.none,
                  hintText: "Search product",
                  prefixIcon: Icon(Icons.search),
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFBDBDBD),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF212121),
                  ),
                ),
              ),
              suggestionsCallback: (pattern) {
                return suggestions
                    .where((name) =>
                        name.toLowerCase().contains(pattern.toLowerCase()))
                    .toList();
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion.toString()),
                );
              },
              onSuggestionSelected: (suggestion) {
                final jsonData = {'search': suggestion};
                final jsonString = jsonEncode(jsonData);
                print('Selected: $suggestion');
                Navigator.pushNamed(context, "/gridpage",
                    arguments: jsonString);
                setState() {
                  _textEditingController.text = suggestion.toString();
                }
              },
            ),
          ),
        ),
        if (filter) Filter(),
      ],
    );
  }
}
