import "package:flutter/material.dart";

class CustomSnackBar{
  BuildContext? context;

  CustomSnackBar({required this.context});
  show(String message){
   ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: Theme.of(context!).textTheme.displayMedium,
          ),
          duration: const Duration(
            seconds: 3,
          ),
          backgroundColor: Theme.of(context!).colorScheme.primary,
        ),
      );

  }

  showError(String message){
   ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.fixed,
          content: Text(
           message,
            style: Theme.of(context!).textTheme.displayMedium,
          ),
          duration: const Duration(
            seconds: 3,
          ),
          backgroundColor: Theme.of(context!).colorScheme.error,
        ),
      );

  }

}