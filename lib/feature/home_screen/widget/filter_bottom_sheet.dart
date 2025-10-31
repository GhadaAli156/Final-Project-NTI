import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/color_manager/color_manager.dart';
import '../../../core/utils/size_config.dart';
import '../cubit/product_cubit.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedCategory = 'All';
  double priceValue = 200;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final productCubit = context.read<ProductCubit>();

    return Padding(
      padding: EdgeInsets.all(SizeConfig.w(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: SizeConfig.w(50),
              height: SizeConfig.h(5),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.h(16)),

          Text(
            'Filter Options',
            style: TextStyle(
              fontSize: SizeConfig.w(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: SizeConfig.h(16)),

          Text(
            'Category',
            style: TextStyle(
              fontSize: SizeConfig.w(14),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: SizeConfig.h(8)),
          Wrap(
            spacing: SizeConfig.w(8),
            children: [
              for (var category in ['PoPular', 'Clothes', 'Watches', 'Bags'])
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.w(14),
                      vertical: SizeConfig.h(8),
                    ),
                    decoration: BoxDecoration(
                      gradient: selectedCategory == category
                          ? ColorManager.primaryColorGradient
                          : null,
                      color: selectedCategory == category
                          ? null
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                      border: Border.all(
                        color: selectedCategory == category
                            ? Colors.transparent
                            : Colors.grey.shade400,
                      ),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: selectedCategory == category
                            ? Colors.white
                            : Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          )
          ,

          SizedBox(height: SizeConfig.h(20)),

          Text(
            'Max Price: \$${priceValue.round()}',
            style: TextStyle(
              fontSize: SizeConfig.w(14),
              fontWeight: FontWeight.w600,
            ),
          ),
          Slider(
            activeColor: ColorManager.primaryColorGradient.colors.first,
            value: priceValue,
            min: 0,
            max: 200,
            divisions: 20,
            label: "\$${priceValue.round()}",
            onChanged: (v) {
              setState(() {
                priceValue = v;
              });
            },
          ),

          SizedBox(height: SizeConfig.h(16)),
          SizedBox(
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: ColorManager.primaryColorGradient,
                borderRadius: BorderRadius.circular(SizeConfig.w(20)),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                  ),
                ),
                onPressed: () {
                  productCubit.filterProducts(
                    category: selectedCategory,
                    maxPrice: priceValue,
                  );
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.h(10)),
                  child: Text(
                    'Apply Filters',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.w(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
