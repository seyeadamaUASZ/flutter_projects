import 'package:get/get.dart';
import 'package:shop/controllers/products_repository.dart';

class ProductsController extends GetxController{
  ProductsRepository productsRepository=ProductsRepository();
  RxBool loading = false.obs;
  List products =[].obs;
  var showGrid = false.obs;



  ProductsController(){
     loadProductsFromRepo();
  }

  loadProductsFromRepo() async {
    loading(true);
    products=await productsRepository.loadsProductsFromApi();
    //print(products);
    loading(false);
  }
  toggleGrid(){
    showGrid(!showGrid.value);
  }
}