// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserController, Store {
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_UserController.hasError'))
          .value;

  final _$usersAtom = Atom(name: '_UserController.users');

  @override
  ObservableList<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$loadingAtom = Atom(name: '_UserController.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_UserController.error');

  @override
  Object get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Object value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadUsersAsyncAction = AsyncAction('_UserController.loadUsers');

  @override
  Future<void> loadUsers() {
    return _$loadUsersAsyncAction.run(() => super.loadUsers());
  }

  final _$addUserAsyncAction = AsyncAction('_UserController.addUser');

  @override
  Future<void> addUser(User user) {
    return _$addUserAsyncAction.run(() => super.addUser(user));
  }

  final _$removeUserAsyncAction = AsyncAction('_UserController.removeUser');

  @override
  Future<void> removeUser(User user) {
    return _$removeUserAsyncAction.run(() => super.removeUser(user));
  }

  @override
  String toString() {
    return '''
users: ${users},
loading: ${loading},
error: ${error},
hasError: ${hasError}
    ''';
  }
}
