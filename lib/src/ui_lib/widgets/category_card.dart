import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String iconUrl;
  final String categoryName;

  CategoryCard({
    required this.iconUrl,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: Image.network(
              iconUrl,
              height: 30,

              fit: BoxFit.contain,
            ),
          ),
          // SizedBox(height: 5),
          Text(
            categoryName,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
