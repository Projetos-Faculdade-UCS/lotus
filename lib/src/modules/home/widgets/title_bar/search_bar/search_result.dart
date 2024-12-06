import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:repositories/repositories.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

/// Reusable widget for displaying a single asset item
class _AssetItemTile extends StatelessWidget {
  const _AssetItemTile({
    required this.asset,
    required this.leadingIcon,
  });

  final Ativo asset;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(asset.nome),
        subtitle: Text('Patrimônio: ${asset.patrimonio}'),
        leading: Icon(leadingIcon),
        onTap: () {
          Modular.to.pop();
          Modular.to.pushNamed('${asset.tipo.route}/${asset.id}');
        },
      ),
    );
  }
}

/// Reusable widget for displaying a section of search results
class _SearchResultSection extends StatelessWidget {
  const _SearchResultSection({
    required this.title,
    required this.assets,
    required this.itemIcon,
  });

  final String title;
  final List<Ativo> assets;
  final IconData itemIcon;

  @override
  Widget build(BuildContext context) {
    if (assets.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...assets.map(
          (asset) => _AssetItemTile(
            asset: asset,
            leadingIcon: itemIcon,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

/// {@template search_result}
/// Widget that displays the search results.
/// {@endtemplate}
class SearchResult extends StatelessWidget {
  /// {@macro search_result}
  const SearchResult({
    required this.exactPatrimonio,
    required this.computadores,
    required this.impressoras,
    required this.monitores,
    super.key,
  });

  /// The ativo that matches the patrimonio.
  final Ativo? exactPatrimonio;

  /// The list of computadores that match the search query.
  final List<Ativo> computadores;

  /// The list of impressoras that match the search query.
  final List<Ativo> impressoras;

  /// The list of monitores that match the search query.
  final List<Ativo> monitores;

  @override
  Widget build(BuildContext context) {
    final hasResults = exactPatrimonio != null ||
        computadores.isNotEmpty ||
        impressoras.isNotEmpty ||
        monitores.isNotEmpty;

    if (!hasResults) {
      return Center(
        child: Text(
          'Sem resultados.',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }

    return SuperListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Exact Patrimonio Section
        if (exactPatrimonio != null) ...[
          _SearchResultSection(
            title: 'Patrimônio exato:',
            assets: [exactPatrimonio!],
            itemIcon: Icons.computer_outlined,
          ),
        ],

        // Computadores Section
        _SearchResultSection(
          title: 'Computadores:',
          assets: computadores,
          itemIcon: Icons.computer_outlined,
        ),

        // Impressoras Section
        _SearchResultSection(
          title: 'Impressoras:',
          assets: impressoras,
          itemIcon: HugeIcons.strokeRoundedPrinter,
        ),

        // Monitores Section
        _SearchResultSection(
          title: 'Monitores:',
          assets: monitores,
          itemIcon: HugeIcons.strokeRoundedTv02,
        ),
      ],
    );
  }
}
