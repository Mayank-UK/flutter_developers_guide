import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../design_system/sizes.dart';

/// A collapsible, copyable code listing that mirrors the React reference
/// `code-block.tsx`.
///
/// Collapsed by default so pages full of examples don't become a wall of
/// code: the language label + toggle stays visible, the source is one tap
/// away. The copy button works whether open or closed.
///
/// By default the [code] string is rendered in a monospace, horizontally
/// scrollable block. Callers that need richer rendering (e.g. markdown
/// loaded from an asset) may supply [body] to override the expanded body
/// while keeping the header chrome and copy behaviour.
class CodeBlock extends StatefulWidget {
  final String code;
  final String? language;
  final String? caption;
  final bool defaultOpen;

  /// Optional override for the expanded body. When null, [code] is rendered
  /// as a monospace, horizontally scrollable [SelectableText].
  final Widget? body;

  const CodeBlock({
    super.key,
    required this.code,
    this.language,
    this.caption,
    this.defaultOpen = false,
    this.body,
  });

  @override
  State<CodeBlock> createState() => _CodeBlockState();
}

class _CodeBlockState extends State<CodeBlock> {
  late bool _open = widget.defaultOpen;
  bool _copied = false;
  Timer? _resetTimer;

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  Future<void> _copy() async {
    try {
      await Clipboard.setData(ClipboardData(text: widget.code));
      if (!mounted) return;
      setState(() => _copied = true);
      _resetTimer?.cancel();
      _resetTimer = Timer(const Duration(milliseconds: 1500), () {
        if (mounted) setState(() => _copied = false);
      });
    } catch (_) {
      // Clipboard may be unavailable; ignore.
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final onSurfaceVariant = colorScheme.onSurfaceVariant;
    final languageLabel = widget.language ?? 'code';

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(DSSizes.sm),
        border: Border.all(color: theme.dividerColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DSSizes.md,
              vertical: DSSizes.xs,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () => setState(() => _open = !_open),
                  borderRadius: BorderRadius.circular(DSSizes.xxs),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DSSizes.xs,
                      vertical: DSSizes.xxs,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12,
                          child: Text(
                            _open ? '▾' : '▸',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: onSurfaceVariant,
                            ),
                          ),
                        ),
                        const SizedBox(width: DSSizes.xs),
                        Text(
                          languageLabel,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontFamily: 'JetBrains Mono',
                            color: onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: _copy,
                  borderRadius: BorderRadius.circular(DSSizes.xxs),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DSSizes.xs,
                      vertical: DSSizes.xxs,
                    ),
                    child: Text(
                      _copied ? '✓ copied' : 'copy',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: _copied
                            ? colorScheme.primary
                            : onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_open) ...[
            Divider(
              height: 1,
              thickness: 1,
              color: theme.dividerColor,
            ),
            widget.body ??
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(DSSizes.md),
                  child: SelectableText(
                    widget.code,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontFamily: 'JetBrains Mono',
                      height: 1.4,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
            if (widget.caption != null)
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  border: Border(
                    top: BorderSide(color: theme.dividerColor),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: DSSizes.md,
                  vertical: DSSizes.xs,
                ),
                child: Text(
                  widget.caption!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: onSurfaceVariant,
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
