import 'package:flutter/material.dart';
import 'package:library_core/misc/constant.dart';
import 'custom_ink_well.dart';

class CustomListTile extends StatelessWidget {
  /// Creates ListTile with leading, title, trailing, image widget for almost every type of ListTile design.
  const CustomListTile({
    Key? key,
    this.color,
    this.avatar,
    this.title,
    this.subTitle,
    this.description,
    this.iconLeading,
    this.iconTrailing,
    this.padding,
    this.iconPadding,
    this.margin,
    this.iconMargin,
    this.listItemTextColor = Colors.transparent,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  /// The GFListTile's background color. Can be given [Color] or [GFColors]
  final Color? color;

  /// type of [Widget] or [GFAvatar] used to create rounded user profile
  final Widget? avatar;

  /// The title to display inside the [GFListTile]. see [Text]
  final Widget? title;

  /// The subTitle to display inside the [GFListTile]. see [Text]
  final Widget? subTitle;

  /// The description to display inside the [GFListTile]. see [Text]
  final Widget? description;

  /// The icon to display inside the [GFListTile]. see [Icon]
  final Widget? iconLeading;
  final Widget? iconTrailing;

  /// defines the margin of GFListTile
  final EdgeInsetsGeometry? iconMargin;
  final EdgeInsetsGeometry? margin;

  /// defines the padding of GFListTile
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? iconPadding;

  /// Whether this list tile is interactive.
  ///
  /// If false, this list tile is styled with the disabled color from the
  /// current [Theme] and the [onTap] and [onLongPress] callbacks are
  /// inoperative.
  final bool enabled;

  /// Called when the user taps this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final GestureTapCallback? onTap;

  /// Called when the user long-presses on this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final GestureLongPressCallback? onLongPress;

  /// If this tile is also [enabled] then icons and text are rendered with the same color.
  ///
  /// By default the selected color is the theme's primary color. The selected color
  /// can be overridden with a [ListTileTheme].
  final bool selected;

  /// The color for the tile's [Material] when it has the input focus.
  final Color? focusColor;

  /// The color for the color of the list item text.
  final Color? listItemTextColor;

  /// The color for the tile's [Material] when a pointer is hovering over it.
  final Color? hoverColor;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// On true state it should focus itself if nothing else is already focused.
  /// Defaults to false
  final bool autofocus;

  @override
  Widget build(BuildContext context) => CustomInkWell(
    onTap: enabled ? onTap : null,
    child: Semantics(
      selected: selected,
      enabled: enabled,
      child: Container(
        padding: padding,
        margin: margin,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             if(iconLeading != null) Container(
               padding: iconPadding,
               margin: iconMargin ?? EdgeInsets.only(right: kPadding8),
              alignment: Alignment.centerLeft,
              child: iconLeading,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  title ?? Container(),
                  subTitle ?? Container(),
                ],
              ),
            ),
            if(iconTrailing != null) Container(
              padding: iconPadding,
              margin: iconMargin ?? EdgeInsets.only(right: kPadding8),
              alignment: Alignment.centerLeft,
              child: iconTrailing,
            )
          ],
        ),
      ),
    ),
  );
}