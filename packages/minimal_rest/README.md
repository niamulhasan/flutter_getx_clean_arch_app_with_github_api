[//]: # (If you like `Either<L, R>` datatype from the `dartz` package, and tired of writting boilerplates for consuming REST Api in `Either<L, R>` This Package is the solution for you.)

[//]: # ()
[//]: # (`MinRest` acts as a REST Client and returns data as your `DataModel` or `Entity` whichever object you want.)

[//]: # ()
[//]: # (## Features)

[//]: # ()
[//]: # (* Making all kind of `http` request)

[//]: # (* It returns your `DataModel` by making a `http` request and returns `Either<YourModel, Error>`)

[//]: # (## Getting started)

[//]: # ()
[//]: # (You need to Initialize the `MinRest` singleton with the base url)

[//]: # (Let's do it int the `main.dart` file)

[//]: # (```dart)

[//]: # (void main&#40;&#41; {  )

[//]: # (  WidgetsFlutterBinding.ensureInitialized&#40;&#41;;  )

[//]: # (  ...)

[//]: # (  MinRest.init&#40;"https://developer.darc.gg/api"&#41;;  )

[//]: # (  ...)

[//]: # (  runApp&#40;Main&#40;&#41;&#41;;  )

[//]: # (})

[//]: # (```)

[//]: # ()
[//]: # (### Make a `GET` request)

[//]: # (1. **Your own DataModel class**)

[//]: # (   Let's say we have a `DataModel`named `UserModel`)

[//]: # (```dart)

[//]: # (  )
[//]: # (class UserModel {  )

[//]: # (  final String name;  )

[//]: # ( final String email;  )

[//]: # (  )
[//]: # (  UserModel&#40;{required this.name, required this.email}&#41;;  )

[//]: # (  )
[//]: # ( factory UserModel.fromJson&#40;Map<String, dynamic> json&#41; {  )

[//]: # (    return UserModel&#40;  )

[//]: # (      name: json['name'],  )

[//]: # (	  email: json['email'],  )

[//]: # (	&#41;;  )

[//]: # (  }  )

[//]: # (  )
[//]: # (  Map<String, dynamic> toJson&#40;&#41; {  )

[//]: # (    return {  )

[//]: # (      'name': name,  )

[//]: # (	  'email': email,  )

[//]: # (	};  )

[//]: # (  }  )

[//]: # (})

[//]: # (```)

[//]: # (2. **Make the API call and get** `Either<MinRestError, UserModel>`)

[//]: # (```dart)

[//]: # (final userOrError = await MinRest&#40;&#41;.getErrorOr<UserModel>&#40;  )

[//]: # (  "/path_to_user_data",  )

[//]: # (  &#40;json&#41; => UserModel.fromJson&#40;json&#41;,  )

[//]: # (&#41;;)

[//]: # (```)

[//]: # (> Note that `MinRestError` is the default error object `MinRest` will return in the `Left` side of `Either`)

[//]: # ()
[//]: # (3. **Fold and using the data**)

[//]: # (   Now you can use `userOrError` just like any `Either<L, R>` object.)

[//]: # (   Let's `fold` userOrError and print the)

[//]: # (   * `name` and `email` of the user if the request and response is successful. &#40;status code from 200 to 199&#41;)

[//]: # (   * or print the `error` status code and `message` of the request is failed)

[//]: # (```dart)

[//]: # (userOrError.fold&#40;  )

[//]: # (  &#40;error&#41; => print&#40;"Error: ${error.code} - ${error.message}"&#41;,  )

[//]: # (  &#40;user&#41; => print&#40;"User: ${user.name} - ${user.email}"&#41;,  )

[//]: # (&#41;;)

[//]: # (```)

[//]: # ()
[//]: # ()
[//]: # ()
[//]: # (## Usage)

[//]: # ()
[//]: # (How to use `MinRest`)

[//]: # (### Get Request)

[//]: # (```dart)

[//]: # (final userOrError = await MinRest&#40;&#41;.getErrorOr<UserModel>&#40;  )

[//]: # (  "/path_to_user_data",  )

[//]: # (  &#40;json&#41; => UserModel.fromJson&#40;json&#41;,  )

[//]: # (  token: token.accessToken, )

[//]: # (&#41;;)

[//]: # (```)

[//]: # (### Post Request)

[//]: # (```dart)

[//]: # (final postData = await MinRest&#40;&#41;.postErrorOr<UserModel>&#40;  )

[//]: # (  "/path_to_user_data",  )

[//]: # (  userModel.toJson&#40;&#41;,  )

[//]: # (  &#40;json&#41; => UserModel.fromJson&#40;json&#41;,  )

[//]: # (  token: token.accessToken,)

[//]: # (&#41;;)

[//]: # (```)

[//]: # (### Patch Request)

[//]: # (```dart)

[//]: # (final patchData = MinRest&#40;&#41;.patchErrorOr<UserModel>&#40;  )

[//]: # (  uri: "/auth/update-profile",  )

[//]: # (  data: userModel.toJson&#40;&#41;,  )

[//]: # (  deSerializer: &#40;json&#41; => UserModel.fromJson&#40;json&#41;,  )

[//]: # (  errorDeserializer: &#40;json&#41; => AppError.fromJson&#40;json&#41;,  )

[//]: # (  token: token.accessToken,  )

[//]: # (&#41;;)

[//]: # (```)

[//]: # ()
[//]: # (### Delete Request)

[//]: # (```dart)

[//]: # (final deleteData = MinRest&#40;&#41;.deleteErrorOr&#40;  )

[//]: # (  uri: "/auth/delete-account",  )

[//]: # (  deSerializer: &#40;json&#41; => RestResponseNoEntity.fromJson&#40;json&#41;,  )

[//]: # (  errorDeserializer: &#40;json&#41; => AppError.fromJson&#40;json&#41;,  )

[//]: # (  token: token.accessToken,  )

[//]: # (&#41;)

[//]: # (```)

[//]: # ()
[//]: # ()
[//]: # ()
[//]: # (> Here AppError is your custom ErrorModel, &#40;Later this will be implemented in other methods as well, Get and Post methods now returns `MinRestError` only&#41;)

[//]: # ()
[//]: # ( )