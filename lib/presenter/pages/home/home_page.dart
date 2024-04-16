import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/presenter/controllers/app_controller.dart';
import 'package:nasa_project/presenter/pages/home/home_bloc.dart';
import 'package:nasa_project/presenter/widgets/image_item_widget.dart';
import 'package:nasa_project/presenter/pages/home/widgets/select_date_home_widget.dart';
import 'package:nasa_project/presenter/shared/app_state.dart';
import 'package:nasa_project/presenter/widgets/custom_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends AppController<HomePage, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      bottomNavigationBar: const CustomBottomNavigationBar(
        position: 1,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 8.0,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SelectDateWidget(
                            initialDate: bloc.initialDateNotifier,
                            finalDate: bloc.finalDateNotifier,
                          ),
                          FilledButton(
                            onPressed: () => bloc.sendSearch(),
                            child: const Text('Search'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<HomeBloc, AppState<List<ImageEntity>>>(
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
                          child: SizedBox.shrink(),
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
