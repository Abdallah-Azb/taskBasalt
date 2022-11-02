// import 'package:flutter/material.dart';
//
// class EmailTextField extends StatelessWidget {
//   final bool? readOnly;
//   final int? maxLines;
//   final TextEditingController controller;
//
//   const EmailTextField({
//     Key? key,
//     required this.controller,
//     this.readOnly = false,
//     this.maxLines = 1,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       readOnly: readOnly ?? false,
//       maxLines: maxLines,
//       decoration: const InputDecoration(
//         labelText: 'email',
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter some text';
//         } else {
//           if (value.toString().isEmail() == false) {
//             return 'Email is Not Valied';
//           } else {
//             return null;
//           }
//         }
//       },
//       enabled: true,
//     );
//   }
// }
