import 'package:flutter/material.dart';

const sizedBox = SizedBox(
  height: 20,
);
const sizedBoxWidth20 = SizedBox(
  width: 20,
);
const registerDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2.0),
  ),
  hintText: 'Email',
  prefixIcon: Icon(Icons.key),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2.0),
  ),
);
