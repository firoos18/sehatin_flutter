import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatin_flutter/home/domain/entities/meal_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<OnFilterPicked>(onFilterPicked);
  }

  final mealItemData = [
    MealItem(
      name: "Grilled Tuna",
      topping: "with Vegetable Salad",
      foodType: FoodType.meal,
      imageUrl:
          "https://ipfs.filebase.io/ipfs/QmaqEc8Up8Eia58qDydnxkYwcpvKHhJDZsHsJHjHqvtkVZ",
      price: "42000",
      rating: 4.7,
      description:
          "Hidangan yang terdiri dari tuna segar yang dipanggang dengan sempurna dan disajikan bersama dengan campuran salad sayuran segar. Tuna yang dipanggang memberikan cita rasa gurih dan lezat, sementara salad sayuran menambahkan kesegaran dan kesehatan pada hidangan ini. Kombinasi antara protein tuna yang kaya nutrisi dan sayuran yang beragam membuat hidangan ini menjadi pilihan yang sehat dan lezat untuk dinikmati.",
    ),
    MealItem(
      name: "Grilled Tuna",
      topping: "with Rice and Green Beans",
      foodType: FoodType.meal,
      imageUrl:
          "https://ipfs.filebase.io/ipfs/QmXymvRmf8DCtjVLQni8RvGLQ3xPZ4aDmdTALxhfk11PYf",
      price: "48000",
      rating: 4.7,
      description:
          "Hidangan yang terdiri dari tuna segar yang dipanggang dengan cita rasa gurih, disajikan bersama nasi yang lezat dan kacang hijau segar. Tuna yang dipanggang memberikan cita rasa yang kaya protein dan tekstur yang lembut, sementara nasi memberikan kekenyangan yang memuaskan, dan kacang hijau menambah sentuhan sayuran yang segar dan kerenyahan pada hidangan ini. Kombinasi ini menciptakan hidangan yang seimbang dan menggugah selera, cocok untuk pencinta seafood.",
    ),
    MealItem(
      name: "Toasted Bread",
      topping: "with Sunny Side Up",
      foodType: FoodType.meal,
      imageUrl:
          "https://ipfs.filebase.io/ipfs/QmVAszBKSQn8w5gNDPzwTNwQZMPHhPKiPZrQ2gZAiw1tgD",
      price: "24000",
      rating: 4.9,
      description:
          "Hidangan sederhana yang terdiri dari irisan roti yang dipanggang hingga kecokelatan yang garing, yang kemudian disajikan dengan telur dadar yang digoreng dengan kuning telur yang utuh dan kuning cerah di atasnya. Kombinasi antara roti yang renyah dan telur dadar yang lembut dan gurih menciptakan hidangan sarapan yang memuaskan dan klasik. Tampilan kuning cerah dari kuning telur yang terpapar matahari memberikan nama 'Sunny Side Up' pada hidangan ini.",
    ),
    MealItem(
      name: "Vegetable Salad",
      topping: "with Boiled Egg & Grilled Duck",
      foodType: FoodType.meal,
      imageUrl:
          "https://ipfs.filebase.io/ipfs/QmZDX1wKLgEWLERpcXs17iWN785MCB1n5gAyaonrVfxX69",
      price: "32000",
      rating: 4.6,
      description:
          "Hidangan yang menyajikan campuran sayuran segar yang dihiasi dengan telur rebus yang lembut dan daging bebek panggang. Sayuran dalam salad memberikan sentuhan kelezatan dan keanekaragaman rasa, sementara telur rebus menambah protein dan tekstur lembut. Daging bebek panggang memberikan cita rasa gurih dan lezat yang melengkapi hidangan ini. Kombinasi ini menciptakan hidangan yang seimbang antara nutrisi dan cita rasa, cocok untuk pencinta salad dan daging.",
    ),
    MealItem(
      name: "Vegetable Salad",
      topping: "with Shrimp & Tartar Sauce",
      foodType: FoodType.meal,
      imageUrl:
          "https://ipfs.filebase.io/ipfs/Qmd5zM9DoBjcepHkBLRsbTANWjEhAKobLm74phDTTYWwtd",
      price: "35000",
      rating: 4.8,
      description:
          "Hidangan yang menggabungkan berbagai macam sayuran segar yang dihiasi dengan udang yang dimasak dengan sempurna dan dilengkapi dengan saus tartar yang lezat. Sayuran memberikan kesegaran dan keragaman rasa, sementara udang memberikan cita rasa laut yang gurih dan protein yang sehat. Saus tartar yang kaya rasa dengan sentuhan asam dan krimi memberikan hidangan ini kelezatan yang tak tertandingi. Kombinasi ini menciptakan hidangan salad yang sehat, segar, dan sangat menggugah selera.",
    ),
    MealItem(
      name: "Garlic Chicken",
      topping: "with Crispy Kailan",
      foodType: FoodType.meal,
      imageUrl:
          "https://ipfs.filebase.io/ipfs/QmXMDPHCaVDoF5fER4p38sCYQr6bvTtw9tyBq87Meyrhu8",
      price: "28000",
      rating: 5.0,
      description:
          "Hidangan yang terdiri dari potongan daging ayam yang dimasak dengan bawang putih hingga harum dan berpadu dengan sayuran kailan yang digoreng hingga renyah. Ayam yang diberi sentuhan bawang putih memberikan cita rasa gurih dan sedikit pedas, sementara kailan yang digoreng menciptakan tekstur renyah yang menarik. Kombinasi antara daging ayam dan sayuran ini menciptakan hidangan yang lezat dan seimbang, dengan cita rasa yang menggugah selera.",
    ),
    MealItem(
      name: "Garlic Chicken",
      topping: "with Crispy Kailan",
      foodType: FoodType.snack,
      imageUrl:
          "https://ipfs.filebase.io/ipfs/QmXMDPHCaVDoF5fER4p38sCYQr6bvTtw9tyBq87Meyrhu8",
      price: "28000",
      rating: 5.0,
      description:
          "Hidangan yang terdiri dari potongan daging ayam yang dimasak dengan bawang putih hingga harum dan berpadu dengan sayuran kailan yang digoreng hingga renyah. Ayam yang diberi sentuhan bawang putih memberikan cita rasa gurih dan sedikit pedas, sementara kailan yang digoreng menciptakan tekstur renyah yang menarik. Kombinasi antara daging ayam dan sayuran ini menciptakan hidangan yang lezat dan seimbang, dengan cita rasa yang menggugah selera.",
    ),
    MealItem(
      name: "Garlic Chicken",
      topping: "with Crispy Kailan",
      foodType: FoodType.snack,
      imageUrl:
          "https://ipfs.filebase.io/ipfs/QmXMDPHCaVDoF5fER4p38sCYQr6bvTtw9tyBq87Meyrhu8",
      price: "28000",
      rating: 5.0,
      description:
          "Hidangan yang terdiri dari potongan daging ayam yang dimasak dengan bawang putih hingga harum dan berpadu dengan sayuran kailan yang digoreng hingga renyah. Ayam yang diberi sentuhan bawang putih memberikan cita rasa gurih dan sedikit pedas, sementara kailan yang digoreng menciptakan tekstur renyah yang menarik. Kombinasi antara daging ayam dan sayuran ini menciptakan hidangan yang lezat dan seimbang, dengan cita rasa yang menggugah selera.",
    ),
  ];

  void onFilterPicked(OnFilterPicked event, Emitter<HomeState> emit) {
    final List<MealItem> filteredItem =
        mealItemData.where((item) => item.foodType == event.foodType).toList();

    emit(const HomeLoading());

    emit(HomeItemLoaded(filteredItem, event.foodType));
  }
}
