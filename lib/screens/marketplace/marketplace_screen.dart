import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/base_view/base_view.dart';
import 'marketplace_view_model.dart';

final _provider = StateNotifierProvider.autoDispose(
  (ref) => MarketplaceViewModel(),
);

/// Screen code: A_07
@RoutePage()
class MarketplaceScreen extends BaseView {
  const MarketplaceScreen({super.key});

  @override
  BaseViewState<MarketplaceScreen, MarketplaceViewModel> createState() =>
      _MarketplaceScreenState();
}

class _MarketplaceScreenState
    extends BaseViewState<MarketplaceScreen, MarketplaceViewModel> {
  @override
  MarketplaceViewModel get viewModel => ref.read(_provider.notifier);

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Marketplace screen'),
    );
  }
}
