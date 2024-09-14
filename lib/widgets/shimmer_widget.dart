import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(physics: const BouncingScrollPhysics(),itemCount: 10,itemBuilder: (context,index)=>Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor:Colors.grey.shade100,
      child:  Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin:
        const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              SizedBox(     height: 80,
                width: 90,),
              SizedBox(width: 16),
              // Text section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Vacancy title
                    Text(
                     '',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),

                    Text(
                     '',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),

                    Text(
                      'Posted: ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ));
  }
}
