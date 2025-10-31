import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/color_manager/color_manager.dart';
import '../../../core/utils/size_config.dart';
import '../cubit/product_cubit.dart';
import 'filter_bottom_sheet.dart';

class CustomSearchFilter extends StatefulWidget {
  const CustomSearchFilter({super.key});

  @override
  State<CustomSearchFilter> createState() => _CustomSearchFilterState();
}

class _CustomSearchFilterState extends State<CustomSearchFilter> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final productCubit = context.read<ProductCubit>();

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(12),
              vertical: SizeConfig.h(4),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.w(30)),
              color: ColorManager.secondaryColor,
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey[700]),
                SizedBox(width: SizeConfig.w(8)),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'What do you need?',
                      border: InputBorder.none,
                    ),
                    onChanged: (query) {
                      productCubit.searchProducts(query);
                    },
                  ),
                ),
                if (_controller.text.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      _controller.clear();
                      productCubit.getProducts();
                      FocusScope.of(context).unfocus();
                    },
                    child: Icon(Icons.clear, color: Colors.grey[600]),
                  ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              backgroundColor: Colors.white,
              builder: (_) => const FilterBottomSheet(),
            );
          },
          child: Container(
            padding: EdgeInsets.all(SizeConfig.w(8)),
            margin: EdgeInsets.only(left: SizeConfig.w(6)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.w(30)),
              gradient: ColorManager.primaryColorGradient,
            ),
            child: Image.asset(
              'assets/filter.png',
              width: SizeConfig.w(24),
              height: SizeConfig.h(24),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
