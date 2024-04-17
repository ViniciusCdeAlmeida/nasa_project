import 'package:flutter/material.dart';

//Custom Sliver App Bar to show a image inside
class DetailAppbarWidget extends StatefulWidget {
  final String title;
  final String? image;

  const DetailAppbarWidget({
    super.key,
    required this.title,
    this.image,
  });

  @override
  State<DetailAppbarWidget> createState() => _DetailAppbarWidgetState();
}

class _DetailAppbarWidgetState extends State<DetailAppbarWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height / 3,
      floating: true,
      pinned: true,
      snap: false,
      backgroundColor: Colors.yellow[800],
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      title: Text(
        widget.title,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: const TextStyle(fontSize: 14.0),
        maxLines: 3,
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsetsDirectional.only(
          bottom: 3.3,
          start: 50,
          end: 50,
        ),
        background: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
          child: Image.network(
            widget.image ??
                'https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
