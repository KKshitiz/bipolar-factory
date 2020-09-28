import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabBar extends StatelessWidget {
  final Function onTap;
  final int currentTab;
  const CustomTabBar({
    Key key,
    this.onTap,
    this.currentTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: MediaQuery.of(context).size.width * 0.1,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTab(
            title: 'API',
            isSelected: currentTab == 0,
            onTap: onTap,
          ),
          CustomTab(
            title: 'Local',
            isSelected: currentTab == 1,
            onTap: onTap,
          )
        ],
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onTap;
  CustomTab({this.title, this.isSelected, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          border: Border.all(
              width: 4, color: isSelected ? Colors.red : Colors.black),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.libreBaskerville(
              textStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
