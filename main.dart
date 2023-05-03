import 'models/Product.dart';
import 'dart:io';

void main(List<String> args) {
  /* -------------------------- Sistemdeki mehsullar -------------------------- */
  Product product1 = Product('iPhone 14', 20, 'Telephone', 2249.99, 1200);
  Product product2 = Product('iPhone 13', 15, 'Telephone', 1849.99, 900);
  Product product3 = Product('iPhone 12', 7, 'Telephone', 1499.99, 700);
  Product product4 = Product('iPhone XS ', 0, 'Telephone', 1000, 500);
  Product product5 = Product('iPhone 11', 2, 'Telephone', 1299.99, 850);
  Product product6 = Product('Acer Aspire', 5, 'Laptop', 1329.99, 600);
  Product product7 = Product('Macbook Pro 16', 7, 'Laptop', 6799.99, 3000);
  Product product8 = Product('Dell Inspiron', 10, 'Laptop', 1149.99, 700);
  Product product9 = Product('Lenovo IdeaPad 5', 9, 'Laptop', 1599.99, 800);
  Product product10 = Product('HP-15', 0, 'Laptop', 1699.99, 954);
  Product product11 = Product('HOFFMANN LED', 5, 'TV', 349.99, 70);
  Product product12 = Product('TOSHIBA LED', 7, 'TV', 599.99, 179);
  Product product13 = Product('LG LED', 3, 'TV', 1649.99, 800);
  Product product14 = Product('Samsung The Frame', 2, 'TV', 3499.99, 1500);
  Product product15 = Product('Sony XR', 0, 'TV', 6499.99, 3000);

  List<Product> products = [
    product1,
    product2,
    product3,
    product4,
    product5,
    product6,
    product7,
    product8,
    product9,
    product10,
    product11,
    product12,
    product13,
    product14,
    product15
  ];

  // List<Product> products = [
  //   product1,
  //   product2,
  //   product3,
  //   product4,
  //   product5,
  //   product6,
  //   product7,
  //   product8,
  //   product9,
  //   product10,
  //   product11,
  //   product12,
  //   product13,
  //   product14,
  //   product15
  // ];

  /* -------------------------------------------------------------------------- */

  /* ------------------------------ Admin girisi ------------------------------ */
  const String username = 'ramin';
  const String password = '123';

  print('Magazamiza xos gelmisiniz!');
  start:
  while (true) {
    stdout.write('Adminsinizse {1}, musterisinizse {2} duymesini basin: ');
    String firstInput = stdin.readLineSync()!;

    switch (firstInput) {
      case '1':
        print('### Admin ###');
        adminLogin:
        while (true) {
          stdout.write('Istifadeci adini daxil edin: ');
          String usernameInput = stdin.readLineSync()!;

          stdout.write('Sifreni daxil edin: ');
          String passwordInput = stdin.readLineSync()!;

          if (usernameInput == username && passwordInput == password) {
            print('Ugurla giris etdiniz!');

            adminOperation:
            while (true) {
              stdout.write(
                  'Mehsullar haqqinda melumat almaq isteyirsinizse {y}, evvele qayitmaq isteyirsinizse {n} duymesini basin: ');
              String adminInput = stdin.readLineSync()!;

              switch (adminInput) {
                case 'y':
                  adminProductInfo:
                  while (true) {
                    stdout.write(
                        'Mehsullar stokda olan mehsullara baxmaq ucun {y}, olmayanlara baxmaq isteyirsinizse {n}, her birine baxmaq ucun {x} duymesini basin: ');
                    String adminProductInput = stdin.readLineSync()!;
                    switch (adminProductInput) {
                      case 'y':
                        showExistProduct(products);
                        continue adminProductInfo;
                      case 'n':
                        showNonExistProdcut(products);
                        continue adminProductInfo;
                      case 'x':
                        showAllProduct(products);
                        continue adminProductInfo;
                      default:
                        operationError();
                    }
                  }
                  break;
                case 'n':
                  continue start;
                default:
                  operationError();
                  continue adminOperation;
              }
            }
          } else {
            loginError();
            continue adminLogin;
          }
        }
      case '2':
        print('### Customer ###');
        print('Ilk once qeydiyyatdan kecmelisiniz!');
        customer:
        while (true) {
          stdout.write('Adinizi daxil edin: ');
          String customerName = stdin.readLineSync()!;
          String customerPassword;

          customerPasswordOp:
          while (true) {
            stdout.write(
                'Sifre daxil edin(minimum 8 simvoldan ibaret olmalidir!): ');
            customerPassword = stdin.readLineSync()!;

            if (customerPassword.length < 8) {
              print('Minimum 8 simvoldan ibaret olsun!');
              continue customerPasswordOp;
            } else {
              print('Ugurla qeydiyyatdan kecdiniz');
              print('*******************************');
              print('### Mehsullar ###');
              print('*******************************');

              customerOperation:
              while (true) {
                stdout.write(
                    'Butun mehsullara baxmaq ucun {y}, ozunuz axtaris etmek isteyirsinizse {x} duymesini basin: ');
                String customerOperatioInput = stdin.readLineSync()!;
                switch (customerOperatioInput) {
                  case 'y':
                    showAllProductForCustomer(products);
                    continue customerOperation;
                  case 'x':
                    search:
                    while (true) {
                      stdout.write(
                          'Novlerimiz(qarsisindaki nomreni daxil edin): \n' +
                              '1. Telephone \n' +
                              '2. Laptop \n' +
                              '3. TV');

                      String searchInput = stdin.readLineSync()!;
                      switch (searchInput) {
                        case '1':
                          showTelephone(products);
                          break;
                        case '2':
                          showLaptop(products);
                          break;
                        case '3':
                          showTv(products);
                          break;
                        default:
                          operationError();
                          continue search;
                      }
                    }
                    break;
                  default:
                    operationError();
                    continue customerOperation;
                }
              }
            }
          }
        }
      default:
        operationError();
        continue start;
    }
  }
}

void showTelephone(List<Product> products) {
  products.forEach((element) {
    if (element.type == 'Telephone') {
      showProduct(element);
    }
  });
}

void showLaptop(List<Product> products) {
  products.forEach((element) {
    if (element.type == 'Laptop') {
      showProduct(element);
    }
  });
}

void showTv(List<Product> products) {
  products.forEach((element) {
    if (element.type == 'TV') {
      showProduct(element);
    }
  });
}

void showAllProductForCustomer(List<Product> products) {
  products.forEach((element) {
    if (element.quantity > 0) {
      print('########################################');
      showProductForCustomer(element);
      print('########################################');
    }
  });
}

void showAllProduct(List<Product> products) {
  products.forEach((element) {
    print('########################################');
    showProduct(element);
    print('########################################');
  });
}

void showExistProduct(List<Product> products) {
  products.forEach((element) {
    if (element.quantity > 0) {
      print('########################################');
      showProduct(element);
      print('########################################');
    }
  });
}

void showNonExistProdcut(List<Product> products) {
  products.forEach((element) {
    if (element.quantity == 0) {
      print('########################################');
      showProduct(element);
      print('########################################');
    }
  });
}

void showProduct(Product element) {
  print(
      'Adi: ${element.name} | Novu: ${element.type} | Sayi: ${element.quantity} | Alis qiymeti: ${element.retailPrice} | Satis qiymeti: ${element.salePrice}');
}

void showProductForCustomer(Product element) {
  print(
      'Adi: ${element.name} | Novu: ${element.type} | Satis qiymeti: ${element.salePrice}');
}

void loginError() {
  print('Istifadeci adiniz ve ya sifreniz yanlisdir! Yeniden cehd edin...');
}

void operationError() {
  print('Invalid input, try again!');
}
