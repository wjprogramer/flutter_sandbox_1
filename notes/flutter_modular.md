# flutter_modular

## Notes

Use _Modular.isModuleReady_ to wait all AsyncBinds to resolve in order to release the module for use.

> IMPORTANT: The order of AsyncBind matters if there are interdependencies of
> other asynchronous binds. For example, if there are two AsyncBinds where **A** depends on **B**,
> AsyncBind **B** must be declared before **A**. Pay attention to this type of order!

---

> NOTE: Modular automatically calls destruction methods Binds of the type:
> Sink/Stream, ChangeNotifier e [Store/Triple]

## Uncovered Content

### Relative Navigation

To navigate between pages, use `Modular.to.navigate`.

```dart
Modular.to.navigate('/login');
```

You can use Relative Navigation to navigate like web

```dart
// Modules Home → Product
Modular.to.navigate('/home/product/list');
Modular.to.navigate('/home/product/detail/3');

// Relative Navigation inside /home/product/list
Modular.to.navigate('detail/3'); // it's the same as /home/product/detail/3
Modular.to.navigate('../config'); // it's the same as /home/config

```

You can also stack pages still using old Navigator API.

```dart
Navigator.pushNamed(context, '/login');
```

Alternatively, you can use `Modular.to.pushNamed`, in which you don't have to provide a `BuildContext`:

```dart
Modular.to.pushNamed('/login');
```

### Others

- [Flutter Web URL routes (Deeplink-like)](https://pub.dev/packages/flutter_modular#flutter-web-url-routes-deeplink-like)
- [Using Modular widgets to retrieve your class](https://pub.dev/packages/flutter_modular#using-modular-widgets-to-retrieve-your-class)
