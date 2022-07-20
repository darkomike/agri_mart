
import 'package:block_agri_mart/components/constants/assets_constant.dart';

class ItemModel {
   String? itemImageUrl;
   String? itemPrice;
   String? itemTitle;


   ItemModel(
       
       this.itemTitle , 
       this.itemPrice , 
       this.itemImageUrl);
   
   ItemModel.fromMap(Map<String, dynamic> map){
     itemImageUrl = map['itemImageUrl'];
     itemPrice = map['itemPrice'];
     itemTitle = map['itemTitle'];
   }
}

final products = [
  {
    'productTitle': 'Banana',
    'itemImageUrl': AssetsConstant.banana,
    'itemPrice': '23.456',
    
  },
  {
    'itemTitle': 'Oranges',
    'itemImageUrl': AssetsConstant.oranges,
    'itemPrice': '23.456',
    
  },
  {
    'itemTitle': 'Cucumber',
    'itemImageUrl': AssetsConstant.cucumber,
    'itemPrice': '23.46',
    
  },
  {
    'itemTitle': 'Pepper',
    'itemImageUrl': AssetsConstant.pepper,
    'itemPrice': '23.46',
    
  },
  {
    'itemTitle': 'Avocado',
    'itemImageUrl': AssetsConstant.avocado,
    'itemPrice': '23.46',
    
  }
];
