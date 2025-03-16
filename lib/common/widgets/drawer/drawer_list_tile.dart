import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget  {
  final IconData iconData;
  final String title;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;
  final VoidCallback itemHandler;

  const DrawerListTile({
    super.key,
    required this.iconData,
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    required this.itemHandler,
  });

  @override
  Widget build(BuildContext context) {

    bool isSelected = selectedIndex == index;


    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Card(
      shape: RoundedRectangleBorder(
        side: isSelected
            ?  BorderSide(color: Colors.grey.shade300, width: 1.5)
            : BorderSide.none,
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: isLightTheme ? Colors.grey.shade50:Colors.blueGrey[900],
      elevation: 0,
      margin: EdgeInsets.only(bottom: 2.0),
      child: ListTile(
        leading: Icon(iconData, color:  isLightTheme?Colors.black:Colors.white),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: isLightTheme?Colors.black:Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: () {
          onTap(index);
          itemHandler();
        },
      ),
    );
  }
}
