// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

@immutable
final class UnitsContainer extends StatelessWidget {
  final String? text;
  String? value;
  List<String>? items;
  void Function(String?)? onChanged;

  UnitsContainer({
    super.key,
    this.text,
    this.value,
    this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(183, 183, 183, 1)),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'delivery-truck.png',
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  width: 1.5.w,
                ),
                Text(
                  text!,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica',
                      color: Colors.black),
                ),
                Row(
                  children: [],
                )
              ],
            ),
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            value: value, // Use value from the list
            items: items!.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'SFProText',
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(183, 183, 183, 1)),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 15.w,
              padding: EdgeInsets.only(left: 9, right: 9),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color.fromRGBO(183, 183, 183, 1)),
                  right: BorderSide(color: Color.fromRGBO(183, 183, 183, 1)),
                  top: BorderSide(color: Color.fromRGBO(183, 183, 183, 1)),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(8),
                ),
                color: Colors.white,
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down_sharp,
              ),
              iconSize: 25,
              iconEnabledColor: Colors.black,
              iconDisabledColor: null,
            ),
            dropdownStyleData: DropdownStyleData(
              elevation: 0,
              maxHeight: 200,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(112, 112, 112, 1)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                color: Colors.white,
              ),
              scrollPadding: EdgeInsets.all(5),
              scrollbarTheme: ScrollbarThemeData(
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 30,
              padding: EdgeInsets.only(left: 9, right: 9),
            ),
          ),
        ),
      ],
    );
  }
}
