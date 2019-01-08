import 'package:flutter/material.dart';


/** 
 * Tab 會被 embeded 到 Page的body,而非取代
 * 所以可看成是一個subpage , 因此沒有 Scaffold
 */
class CreateTab extends StatelessWidget {
  @override
  Widget build(ctx) {
    return Center( 
      child: Text('Create tab'),
    );
  }
}
