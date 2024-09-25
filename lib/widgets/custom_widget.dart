import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  final TextEditingController cont;
  final String message;
  String? Function(String?)? validator;
  Icon? icon;
  final dynamic emptyMessage;
  Color? textColor;
  
  double? fontsize;
  
  bool? align=false;
  TextFieldWidget({
    super.key, 
    required this.message,
    required this.cont, 
    this.validator,
    required this.emptyMessage,
    this.icon,
    this.textColor,
    required this.fontsize,
    this.align
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
              
              textAlign: align==true?TextAlign.center:TextAlign.left,
              controller: cont,
              decoration:  InputDecoration(
                
                prefixIcon: icon,
                hintText: (message),
                hintStyle: TextStyle(
                    fontSize: fontsize, 
                    color: textColor ?? Colors.grey.shade700
                ),
              ),
              keyboardType: TextInputType.text,
              validator: validator?? (value){
                if(value==null || value.isEmpty){
                  return emptyMessage;
                }
                return null;
              },
              
            );
  }
}

class TextWidget extends StatelessWidget {
  
  final String message;
  final double fontsize;
  const TextWidget({super.key, required this.message,required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: message,
            style: TextStyle(
              fontSize: fontsize,
              color: Colors.teal.shade400,
            ),
          ),
          TextSpan(
            text: "*",
            style: TextStyle(
              fontSize: fontsize,
              color: Colors.red,
            ),
          )
        ]
      )
    );
  }
}

