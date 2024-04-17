import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/presenter/controllers/app_controller.dart';
import 'package:nasa_project/presenter/widgets/image_item_widget.dart';
import 'package:nasa_project/presenter/pages/saved/saved_bloc.dart';
import 'package:nasa_project/presenter/shared/app_state.dart';
import 'package:nasa_project/presenter/widgets/custom_bottom_navigation_bar.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});
  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends AppController<SavedPage, SavedBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      bottomNavigationBar: const CustomBottomNavigationBar(
        position: 1,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Saved images'),
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocBuilder<SavedBloc, AppState<List<ImageEntity>>>(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state.isError) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state.isInit) {
                        return const Center(
                          child: Text('data'),
                        );
                      }
                      return Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          ...state.data!.map(
                            (image) => ImageItemWidget(image: image),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
