abstract class PrintHelper {
  printInfo() => print(getInfo());
  getInfo();
}

class Meta {
  double price;
  String name;
  Meta(this.name, this.price);
}
// 定义商品Item类

class Item extends Meta {
  Item(String name, num price) : super(name, price);
  Item operator +(Item item) => Item(name + item.name, price + item.price);
}

// 定义购物车类
class ShoppingCart extends Meta with PrintHelper {
  DateTime date;
  String code;
  List<Item> bookings;

  ShoppingCart({name}) : this.withCode(name: name, code: null);
  ShoppingCart.withCode({name, this.code})
      : date = DateTime.now(),
        super(name, 0);
  double get price => bookings.reduce((value, ele) => value + ele).price;

  getInfo() => '''购物车信息:
        -----------------------------'
         用户名: $name
         优惠码: ${code ?? " 没有 "}
         总价:   $price
         日期:   $date
        -----------------------------''';
}

void main() {
  ShoppingCart.withCode(name: '张三', code: '123456')
    ..bookings = [Item('苹果', 10.0), Item('鸭梨', 20.0)]
    ..printInfo();
  ShoppingCart(name: '李四')
    ..bookings = [Item('香蕉', 15.0), Item('西瓜', 40.0)]
    ..printInfo();
}
