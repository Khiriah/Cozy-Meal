import 'package:flutter/material.dart';

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.playlist_remove_outlined,
            size: 100,
            color: Colors.grey,
          ),
          SizedBox(
            height: 18,
          ),
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            child: Text('Your Wish list is empty'),
          ),
          SizedBox(
            height: 22,
          ),

        ],
      ),
    );
  }
}
