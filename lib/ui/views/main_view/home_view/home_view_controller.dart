import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/apis/category_model.dart';
import 'package:meal_monkey/core/data/models/apis/meal_model.dart';
import 'package:meal_monkey/core/data/repositories/category_repository.dart';
import 'package:meal_monkey/core/data/repositories/meal_repository.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/core/enums/operation_type.dart';
import 'package:meal_monkey/core/enums/request_status.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';

class HomeController extends BaseController {
  TextEditingController searchController = TextEditingController();

  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<MealModel> mealList = <MealModel>[].obs;

  bool get isCategoryLoading =>
      requestStatus == RequestStatus.LOADING &&
      operationType == OperationType.CATEGORY;

  bool get isMealLoading =>
      requestStatus == RequestStatus.LOADING &&
      operationType == OperationType.MEAL;

  @override
  void onInit() {
    getAllCategory();
    getAllMeal();
    super.onInit();
  }

  void getAllCategory() {
    runFutureFunctionWithLoading(
      operationType: OperationType.CATEGORY,
      function: CategoryRepository().getAll().then(
        (value) {
          value.fold(
            (l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            },
            (r) {
              // categoryList.clear();
              categoryList.addAll(r);
            },
          );
        },
      ),
    );
  }

  void getAllMeal() {
    runFutureFunctionWithLoading(
      operationType: OperationType.MEAL,
      function: MealRepository().getAll().then(
        (value) {
          value.fold(
            (l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            },
            (r) {
              // mealList.clear();
              mealList.addAll(r);
            },
          );
        },
      ),
    );
  }
}