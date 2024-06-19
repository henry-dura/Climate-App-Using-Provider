import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 25,
      style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.white70),
      decoration: InputDecoration(
        hintText: 'Search City',
        hintStyle: const TextStyle(color:Colors.white70),
        prefixIcon: const Icon(Icons.search,size: 45,color: Colors.white70,),
        filled: true,
        fillColor: Colors.black87,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none)
      ),
      onSubmitted: (String val){
        if(val.length > 2){
          print('Entered City is : $val');
        }else{print("Enter valid city");}


      },
    );
  }
}