import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/domain/enums/media_type_enum.dart';

class ImageItemWidget extends StatelessWidget {
  final ImageEntity image;
  const ImageItemWidget({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        child: image.type == MediaTypeEnum.video
                            ? const Text('No image')
                            : CachedNetworkImage(
                                imageUrl: image.file,
                                height: 500,
                                width: 320,
                                fit: BoxFit.cover,
                              ),
                      ),
                      IconButton(
                        onPressed: () => Modular.to.pushNamed(
                          '/details/',
                          arguments: {
                            'image': image,
                          },
                        ),
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Date: ${DateFormat('yyyy-MM-dd').format(image.date)}',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Text(
                      image.title,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
