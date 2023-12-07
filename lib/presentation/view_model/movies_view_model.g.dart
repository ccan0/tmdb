// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moviesViewModelHash() => r'282f4091dd4d3ce9a136b0baa97a5c7dd52493ad';

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

abstract class _$MoviesViewModel
    extends BuildlessAutoDisposeAsyncNotifier<List<MovieDetailModel>> {
  late final ScrollController scrollController;

  FutureOr<List<MovieDetailModel>> build({
    required ScrollController scrollController,
  });
}

/// See also [MoviesViewModel].
@ProviderFor(MoviesViewModel)
const moviesViewModelProvider = MoviesViewModelFamily();

/// See also [MoviesViewModel].
class MoviesViewModelFamily extends Family<AsyncValue<List<MovieDetailModel>>> {
  /// See also [MoviesViewModel].
  const MoviesViewModelFamily();

  /// See also [MoviesViewModel].
  MoviesViewModelProvider call({
    required ScrollController scrollController,
  }) {
    return MoviesViewModelProvider(
      scrollController: scrollController,
    );
  }

  @override
  MoviesViewModelProvider getProviderOverride(
    covariant MoviesViewModelProvider provider,
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
  String? get name => r'moviesViewModelProvider';
}

/// See also [MoviesViewModel].
class MoviesViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MoviesViewModel, List<MovieDetailModel>> {
  /// See also [MoviesViewModel].
  MoviesViewModelProvider({
    required ScrollController scrollController,
  }) : this._internal(
          () => MoviesViewModel()..scrollController = scrollController,
          from: moviesViewModelProvider,
          name: r'moviesViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$moviesViewModelHash,
          dependencies: MoviesViewModelFamily._dependencies,
          allTransitiveDependencies:
              MoviesViewModelFamily._allTransitiveDependencies,
          scrollController: scrollController,
        );

  MoviesViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scrollController,
  }) : super.internal();

  final ScrollController scrollController;

  @override
  FutureOr<List<MovieDetailModel>> runNotifierBuild(
    covariant MoviesViewModel notifier,
  ) {
    return notifier.build(
      scrollController: scrollController,
    );
  }

  @override
  Override overrideWith(MoviesViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: MoviesViewModelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<MoviesViewModel,
      List<MovieDetailModel>> createElement() {
    return _MoviesViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MoviesViewModelProvider &&
        other.scrollController == scrollController;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scrollController.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MoviesViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<List<MovieDetailModel>> {
  /// The parameter `scrollController` of this provider.
  ScrollController get scrollController;
}

class _MoviesViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MoviesViewModel,
        List<MovieDetailModel>> with MoviesViewModelRef {
  _MoviesViewModelProviderElement(super.provider);

  @override
  ScrollController get scrollController =>
      (origin as MoviesViewModelProvider).scrollController;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
