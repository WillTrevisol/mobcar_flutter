// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carlist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarListStore on _CarListStoreBase, Store {
  Computed<bool>? _$isButtonActiveComputed;

  @override
  bool get isButtonActive =>
      (_$isButtonActiveComputed ??= Computed<bool>(() => super.isButtonActive,
              name: '_CarListStoreBase.isButtonActive'))
          .value;

  late final _$newItemTitleAtom =
      Atom(name: '_CarListStoreBase.newItemTitle', context: context);

  @override
  String get newItemTitle {
    _$newItemTitleAtom.reportRead();
    return super.newItemTitle;
  }

  @override
  set newItemTitle(String value) {
    _$newItemTitleAtom.reportWrite(value, super.newItemTitle, () {
      super.newItemTitle = value;
    });
  }

  late final _$_CarListStoreBaseActionController =
      ActionController(name: '_CarListStoreBase', context: context);

  @override
  void setNewItemTitle(String value) {
    final _$actionInfo = _$_CarListStoreBaseActionController.startAction(
        name: '_CarListStoreBase.setNewItemTitle');
    try {
      return super.setNewItemTitle(value);
    } finally {
      _$_CarListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newItemTitle: ${newItemTitle},
isButtonActive: ${isButtonActive}
    ''';
  }
}
