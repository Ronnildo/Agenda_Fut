import "package:flutter/material.dart";

class CustomSnackBar{
  BuildContext? context;

  CustomSnackBar({required this.context});
  show(String message){
   ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            message,
            style: Theme.of(context!).textTheme.labelMedium,
          ),
          duration: const Duration(
            seconds: 2,
          ),
          backgroundColor: Theme.of(context!).colorScheme.primary,
        ),
      );

  }

  showError(String message){
   ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
           message,
            style: Theme.of(context!).textTheme.labelMedium,
          ),
          duration: const Duration(
            seconds: 2,
          ),
          backgroundColor: Theme.of(context!).colorScheme.error,
        ),
      );

  }

}