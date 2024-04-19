import 'package:flutterprojects/colors/Colors.dart';
import 'package:flutterprojects/models/Product.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  RxDouble subtotal = 0.0.obs;
  RxDouble total = 0.0 .obs;
  RxList<Product> products = [
    Product(
        name: 'Nike Club Max',
        price: 64.95,
        image: 'images/addcardpageimage/shoes1.png', quantity: 1,colorsAvail: ShoesColors.nikeJordan ),
    Product(
        name: 'NikeAir Max 200',
        price: 64.95,
        image: 'images/addcardpageimage/shoes2.png', quantity: 1,colorsAvail: ShoesColors.nikeAirMax),
    Product(
        name: 'Nike Air Max',
        price: 64.95,
        image: 'images/addcardpageimage/shoes3.png', quantity: 1,colorsAvail: ShoesColors.nikeClubMax),

  ].obs;


  setQuantity(bool isIncrement, int index){
    if(isIncrement){
      print("Incrementing the data");
      products[index].quantity+=1;
      print("data  ${products[index].quantity}");
    }else{
      products[index].quantity-=1;
    }
    calculateTotal();
    update(["kery"]);
  }
  removeQuantity(int index){
    products.removeAt(index);
    print("data removed ${products.length}");

    calculateTotal();
    update(["kery"]);
  }
  calculateSubtotal() {

    subtotal.value=0;
    products.forEach((product) {
          subtotal.value+=product.price * product.quantity;
    });
    update(["Key"]);
  }


   calculateTotal() {
     calculateSubtotal();
    if(products.isNotEmpty){
            total.value = subtotal.value+40.90;
    }else{
      total.value=subtotal.value;
    }
     update(["Key"]);
  }
  addProductToCart(Product product){
    products.add(product);
  }
}