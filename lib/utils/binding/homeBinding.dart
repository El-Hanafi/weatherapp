class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeController(city:"Marrakesh"));
  }
}