import 'package:filmr/app/data/utils/favorite_movie_keeper.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  RxBool isClearing = false.obs;
  clearHiveData() {
    isClearing.value = true;
    FavouriteMoviesKeeper.clearDatabase();
    isClearing.value = false;
  }
}
