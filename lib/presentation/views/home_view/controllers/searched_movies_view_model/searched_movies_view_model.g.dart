// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_movies_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchedMoviesViewModelHash() =>
    r'5c6b17aa44bfa87ff08745e353829c2f8a202b4c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SearchedMoviesViewModel
    extends BuildlessAutoDisposeAsyncNotifier<List<MovieDetailModel>> {
  late final ScrollController? scrollController;

  FutureOr<List<MovieDetailModel>> build({
    ScrollController? scrollController,
  });
}

/// See also [SearchedMoviesViewModel].
@ProviderFor(SearchedMoviesViewModel)
const searchedMoviesViewModelProvider = SearchedMoviesViewModelFamily();

/// See also [SearchedMoviesViewModel].
class SearchedMoviesViewModelFamily
    extends Family<AsyncValue<List<MovieDetailModel>>> {
  /// See also [SearchedMoviesViewModel].
  const SearchedMoviesViewModelFamily();

  /// See also [SearchedMoviesViewModel].
  SearchedMoviesViewModelProvider call({
    ScrollController? scrollController,
  }) {
    return SearchedMoviesViewModelProvider(
      scrollController: scrollController,
    );
  }

  @override
  SearchedMoviesViewModelProvider getProviderOverride(
    covariant SearchedMoviesViewModelProvider provider,
  ) {
    return call(
      scrollController: provider.scrollController,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchedMoviesViewModelProvider';
}

/// See also [SearchedMoviesViewModel].
class SearchedMoviesViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SearchedMoviesViewModel,
        List<MovieDetailModel>> {
  /// See also [SearchedMoviesViewModel].
  SearchedMoviesViewModelProvider({
    ScrollController? scrollController,
  }) : this._internal(
          () => SearchedMoviesViewModel()..scrollController = scrollController,
          from: searchedMoviesViewModelProvider,
          name: r'searchedMoviesViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchedMoviesViewModelHash,
          dependencies: SearchedMoviesViewModelFamily._dependencies,
          allTransitiveDependencies:
              SearchedMoviesViewModelFamily._allTransitiveDependencies,
          scrollController: scrollController,
        );

  SearchedMoviesViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scrollController,
  }) : super.internal();

  final ScrollController? scrollController;

  @override
  FutureOr<List<MovieDetailModel>> runNotifierBuild(
    covariant SearchedMoviesViewModel notifier,
  ) {
    return notifier.build(
      scrollController: scrollController,
    );
  }

  @override
  Override overrideWith(SearchedMoviesViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchedMoviesViewModelProvider._internal(
        () => create()..scrollController = scrollController,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scrollController: scrollController,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SearchedMoviesViewModel,
      List<MovieDetailModel>> createElement() {
    return _SearchedMoviesViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchedMoviesViewModelProvider &&
        other.scrollController == scrollController;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scrollController.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchedMoviesViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<List<MovieDetailModel>> {
  /// The parameter `scrollController` of this provider.
  ScrollController? get scrollController;
}

class _SearchedMoviesViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchedMoviesViewModel,
        List<MovieDetailModel>> with SearchedMoviesViewModelRef {
  _SearchedMoviesViewModelProviderElement(super.provider);

  @override
  ScrollController? get scrollController =>
      (origin as SearchedMoviesViewModelProvider).scrollController;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
