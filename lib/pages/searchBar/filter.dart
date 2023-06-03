import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(onTap: (){
          
          openFilterDialog(context);
        } 
        , child: ListTile(leading: Icon(Icons.filter_alt_outlined),trailing: Text("Filter"),),);
  }
}


// functiion to shw dialog box
void openFilterDialog(BuildContext context) async {
    final List<String> sizeOptions = ['Small', 'Medium', 'Large'];
    final List<String> priceOptions = ['Min', 'Max'];

    final selectedSize = null;
     final selectedPrice = null;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filter'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDropdown('Size', sizeOptions, selectedSize),
              _buildDropdown('Price', priceOptions, selectedPrice),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final Map<String, String> selectedFilters = {
                  'Size': selectedSize ?? '',
                  'Price': selectedPrice ?? '',
                };

                Navigator.pop(context, selectedFilters);
              },
              child: Text('Apply'),
            ),
          ],
        );
      },
    ).then((selectedFilters) {
      if (selectedFilters != null) {
        // Do something with selected filters
        print(selectedFilters);
      }
    });
  }

  Widget _buildDropdown(String label, List<String> options, String? selectedOption) {
    return DropdownButton<String>(
      hint: Text(label),
      value: selectedOption,
      onChanged: (value) {
        // setState(() {
          print(value);
        // });
      },
      items: options.map<DropdownMenuItem<String>>((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );
  }
