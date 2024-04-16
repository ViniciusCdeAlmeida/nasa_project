import 'package:flutter/material.dart';
import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/presenter/controllers/app_controller.dart';
import 'package:nasa_project/presenter/pages/details/details_bloc.dart';

class DetailPage extends StatefulWidget {
  final ImageEntity image;

  const DetailPage({
    required this.image,
    super.key,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends AppController<DetailPage, DetailsBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Expanded(
          child: Text(
            widget.image.title,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                child: Image.network(
                  widget.image.file,
                  height: 500,
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
              Card(
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'date: ${widget.image.date}',
                      ),
                      Text(
                        widget.image.explanation,
                        textAlign: TextAlign.justify,
                      ),
                      FilledButton(
                        child: const Text('Save'),
                        onPressed: () {
                          bloc.saveData(widget.image);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
