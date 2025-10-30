<<<<<<< HEAD
import 'package:firebase_auth/firebase_auth.dart';
=======
>>>>>>> 15064677cafd3a76885c2277188b8d3ea7dad65a
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_nti_app/feature/home_screen/cubit/product_cubit.dart';
import 'package:project_nti_app/feature/home_screen/widget/categoty_selector.dart';
import 'package:project_nti_app/feature/home_screen/widget/custom_home_app_bar.dart';
import 'package:project_nti_app/feature/home_screen/widget/custom_search_filter.dart';
import 'package:project_nti_app/feature/home_screen/widget/favorite_toggle_icon.dart';
import '../../core/color_manager/color_manager.dart';
import '../../core/utils/size_config.dart';

class HomeScreenProduct extends StatefulWidget {
  const HomeScreenProduct({super.key});

  @override
  State<HomeScreenProduct> createState() => _HomeScreenProductState();
}

class _HomeScreenProductState extends State<HomeScreenProduct> {
  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }
<<<<<<< HEAD

=======
>>>>>>> 15064677cafd3a76885c2277188b8d3ea7dad65a
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.h(24),
          left: SizeConfig.w(16),
          right: SizeConfig.w(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHomeAppBar(),
              SizedBox(height: SizeConfig.h(20)),
              const CustomSearchFilter(),
<<<<<<< HEAD
              BlocConsumer<ProductCubit, ProductState>(
=======
              BlocConsumer<ProductCubit,ProductState>(
>>>>>>> 15064677cafd3a76885c2277188b8d3ea7dad65a
                builder: (context, state) {
                  if (state is ProductError) {
                    return Text(state.error);
                  }
                  if (state is ProductLoading) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
<<<<<<< HEAD
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.darkGray,
                        ),
                      ),
=======
                      child: const Center(child: CircularProgressIndicator(
                        color: ColorManager.darkGray,
                      )),
>>>>>>> 15064677cafd3a76885c2277188b8d3ea7dad65a
                    );
                  }

                  if (state is ProductSuccess) {
                    return Column(
                      children: [
                        SizedBox(height: SizeConfig.h(20)),
                        const CategorySelector(),
                        SizedBox(height: SizeConfig.h(20)),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.products.length,
<<<<<<< HEAD
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: SizeConfig.screenWidth < 600
                                    ? 2
                                    : 4,
                                mainAxisExtent: SizeConfig.h(250),
                                crossAxisSpacing: SizeConfig.w(10),
                                mainAxisSpacing: SizeConfig.h(10),
                              ),
=======
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: SizeConfig.screenWidth < 600 ? 2 : 4,
                            mainAxisExtent: SizeConfig.h(250),
                            crossAxisSpacing: SizeConfig.w(10),
                            mainAxisSpacing: SizeConfig.h(10),
                          ),
>>>>>>> 15064677cafd3a76885c2277188b8d3ea7dad65a
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        ClipRRect(
<<<<<<< HEAD
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                top: Radius.circular(16),
                                              ),
=======
                                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
>>>>>>> 15064677cafd3a76885c2277188b8d3ea7dad65a
                                          child: Image.network(
                                            state.products[index].image,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          right: 5,
                                          top: 5,
<<<<<<< HEAD
                                          child: FavoriteToggleIcon(
                                            productName:
                                                state.products[index].name,
                                            userId: FirebaseAuth
                                                .instance
                                                .currentUser!
                                                .uid,
                                          ),
=======
                                          child: FavoriteToggleIcon(),
>>>>>>> 15064677cafd3a76885c2277188b8d3ea7dad65a
                                        ),
                                      ],
                                    ),
                                  ),
<<<<<<< HEAD

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.products[index].name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "\$${state.products[index].price}",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
=======
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(state.products[index].name, style: const TextStyle(fontWeight: FontWeight.bold)), // هنا استخدم products[index]
                                        const SizedBox(height: 4),
                                        Text("\$${state.products[index].price}", style: const TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                  )
>>>>>>> 15064677cafd3a76885c2277188b8d3ea7dad65a
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return Text('data');
                },
                listener: (context, state) {
                  if (state is ProductError) {
<<<<<<< HEAD
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
              ),
            ],
          ),
=======
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },)
            ],
          ),

>>>>>>> 15064677cafd3a76885c2277188b8d3ea7dad65a
        ),
      ),
    );
  }
}
