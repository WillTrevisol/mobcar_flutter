import 'package:mobx/mobx.dart';
part 'carlist_store.g.dart';

// ignore: library_private_types_in_public_api
class CarListStore = _CarListStoreBase with _$CarListStore;

abstract class _CarListStoreBase with Store {

  @observable
  String newItemTitle = '';

  @action
  void setNewItemTitle(String value) => newItemTitle = value;

  @computed
  bool get isButtonActive => newItemTitle.isNotEmpty;


}