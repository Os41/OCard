import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(width: double.infinity, height: 200, color: Colors.amber,),
          Container(width: double.infinity, height: 200, color: Colors.blue,),
          Container(width: double.infinity, height: 200, color: Colors.limeAccent,),
        ],
    );
  }
}

// CustomScrollView(
//   slivers: <Widget>[
//     SliverPersistentHeader(
//       pinned: true,
//       delegate: _CustomHeaderDelegate(
//         minHeight: 140.0,
//         maxHeight: 390.0,
//         child: Container(
//           color: Colors.white,
//           child: Center(
//             child: Container(
//               margin: EdgeInsets.all(m_10),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color: Color(secondaryColor),
//                   borderRadius: BorderRadius.all(Radius.circular(br_35))
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.all(m_20),
//                     width: double.infinity,
//                     height: 70,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: double.infinity,
//                           alignment: Alignment.center,
//                           child: RichText(
//                             text: TextSpan(
//                               style: const TextStyle(
//                                 fontSize: fs16,
//                                 color: Colors.white,
//                               ),
//                               children: <TextSpan>[
//                                 const TextSpan(text: 'Hello, '),
//                                 TextSpan(text: name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: double.infinity,
//                           child: Row(
//                             children: [
//                               IconButton(
//                                   onPressed: () => {},
//                                   iconSize: is30,
//                                   icon: const Icon(
//                                       Icons.notifications_active_rounded,
//                                       color: Colors.white
//                                   )
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.fromLTRB(p10, 0, 0, 0),
//                                 child: GestureDetector(
//                                     onTap: () => {
//                                       setState(() {
//                                         _visible = !_visible;
//                                       })
//                                     },
//                                     child: const ClipOval(
//                                       child: Image(
//                                         image: AssetImage('assets/images/Omar.jpg'),
//                                         width: 60.0,
//                                         height: 60.0,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     )
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(m_20),
//                     width: double.infinity,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Text(
//                             "Your total balance",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w300
//                             )
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: p10),
//                           child: Text(
//                               getTotalBalance(),
//                               style: const TextStyle(
//                                 fontSize: fs34,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               )
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(m_20),
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Column(
//                           children: [
//                             const Text('Update', style: TextStyle(color: Colors.white, fontSize: fs16)),
//                             Container(
//                               margin: const EdgeInsets.all(m10),
//                               padding: const EdgeInsets.all(p5),
//                               decoration: BoxDecoration(
//                                 color: Color(primaryColor),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: IconButton(
//                                   onPressed: () => {},
//                                   iconSize: is30,
//                                   icon: const Icon(
//                                       Icons.ac_unit_outlined,
//                                       color: Colors.white
//                                   )
//                               ),
//                             )
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             const Text('Add card', style: TextStyle(color: Colors.white, fontSize: fs16)),
//                             Container(
//                               margin: const EdgeInsets.all(m10),
//                               decoration: const BoxDecoration(
//                                 color: Colors.white12,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: DottedBorder(
//                                 borderType: BorderType.Circle,
//                                 color: Colors.white,
//                                 dashPattern: const [6, 6],
//                                 strokeWidth: 2,
//                                 strokeCap: StrokeCap.round,
//                                 child: IconButton(
//                                     onPressed: () => {},
//                                     iconSize: is34,
//                                     icon: const Icon(
//                                         Icons.add,
//                                         color: Colors.white
//                                     )
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             const Text('Info', style: TextStyle(color: Colors.white, fontSize: fs16)),
//                             Container(
//                               margin: const EdgeInsets.all(m5),
//                               padding: const EdgeInsets.all(p5),
//                               decoration: BoxDecoration(
//                                 color: Color(primaryColor),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: IconButton(
//                                   onPressed: () => {},
//                                   iconSize: is30,
//                                   icon: const Icon(
//                                       Icons.info_outline_rounded,
//                                       color: Colors.white
//                                   )
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//     SliverList(
//       delegate: SliverChildListDelegate([
//         Container(width: double.infinity, height: 200, color: Colors.amber,),
//         Container(width: double.infinity, height: 200, color: Colors.blue,),
//         Container(width: double.infinity, height: 200, color: Colors.limeAccent,),
//       ]),
//     ),
//   ],
// )
class _CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _CustomHeaderDelegate({required this.minHeight, required this.maxHeight, required this.child});

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_CustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
