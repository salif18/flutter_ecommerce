import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
    required this.formkey,
    required this.valuesearchController,
    required this.handleChange,
  });

  final dynamic formkey;
  final dynamic valuesearchController;
  final dynamic handleChange;

  @override
  Widget build(BuildContext context) {
    return  Stack(
          children: [
            Form(
              key: formkey,
              child: TextFormField(
                controller: valuesearchController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Aucune valeur à rechercher ?";
                  }
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child:Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 112, 67),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child:  IconButton(
                  onPressed: () {
                    final value = valuesearchController.text;
                     handleChange(value);
                  },
                  icon: const Icon(Icons.search_outlined,
                      size: 35, color: Colors.white),
                ),
              ),
            ),
          ],
        );
  }
}
