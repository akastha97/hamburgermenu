import 'package:flutter/material.dart';

import '../models/menu_model.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 100)),
          const Text(
            "S H O P A H O L I C",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: MenuModel.getMenuList.length,
              itemBuilder: (context, index) {
                MenuModel menu = MenuModel.getMenuList[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      Navigator.popAndPushNamed(context, menu.route);
                      
                    });
                  },
                  child: ListTile(
                    selected: selectedIndex == index,
                    selectedTileColor: Theme.of(context)
                        .colorScheme
                        .inversePrimary
                        .withOpacity(0.4),
                    contentPadding: EdgeInsets.zero,
                    leading: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Visibility(
                          visible: selectedIndex == index,
                          child: Container(
                            height: 50,
                            width: 5,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        menu.icon
                      ],
                    ),
                    title: Padding(
                        padding: EdgeInsets.zero,
                        child: Text(
                          menu.title,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
