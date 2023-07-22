import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  unit: 'kg',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  unit: 'kg',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  unit: 'un',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  unit: 'un',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  unit: 'kg',
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categorias = [
  'Frutas',
  'Graos',
  'verduras',
  'Temperos',
  'Cereais'
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 2),
  CartItemModel(item: mango, quantity: 1),
  CartItemModel(item: guava, quantity: 3),
];

UserModel user = UserModel(
  name: 'Guilherme',
  email: 'guilhermebomdespacholemos@gmail.com',
  phone: '65999671516',
  cpf: '07067221620',
  password: 'Volmatavs#1',
);

List<OrderModel> orders = [
  OrderModel(
    id: 'asd324asd34',
    createdDateTime: DateTime.parse('2023-07-12 20:50:41.234'),
    overdueDateTime: DateTime.parse('2023-07-12 22:30:41.234'),
    items: [
      CartItemModel(item: apple, quantity: 2),
      CartItemModel(item: papaya, quantity: 3)
    ],
    status: 'pending_payment',
    copyAndPaste: 'h5gf76j3282bsd6',
    total: 11.0,
  ),
  OrderModel(
    id: 'aaewrfd324a23r34',
    createdDateTime: DateTime.parse('2023-07-12 20:50:41.234'),
    overdueDateTime: DateTime.parse('2023-07-12 22:30:41.234'),
    items: [
      CartItemModel(item: mango, quantity: 5),
      CartItemModel(item: kiwi, quantity: 1)
    ],
    status: 'delivered',
    copyAndPaste: 'h5gf76j3282bsd6',
    total: 11.0,
  ),
  OrderModel(
    id: 'aaewrfd324a23r34',
    createdDateTime: DateTime.parse('2023-07-12 20:50:41.234'),
    overdueDateTime: DateTime.parse('2023-07-12 22:30:41.234'),
    items: [
      CartItemModel(item: mango, quantity: 5),
      CartItemModel(item: kiwi, quantity: 1)
    ],
    status: 'refunded',
    copyAndPaste: 'h5gf76j3282bsd6',
    total: 11.0,
  )
];
