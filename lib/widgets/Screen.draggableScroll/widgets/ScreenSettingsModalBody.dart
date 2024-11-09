import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/providers/AppProvider.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'ScreenSettingsSelect.dart';

import '../messages/keys.dart';
import '../TestKeys.dart';

final Map<String, Map<String, String>> map = {
  "en": {
    "label": "English",
    "trans": ScreenWidgetMessages.smEnglish,
    "emoji": Emojis.flagUnitedStates,
  },
  "zh": {
    "label": "中文",
    "trans": ScreenWidgetMessages.smChinese,
    "emoji": Emojis.flagChina,
  },
  "ar": {
    "label": "عربى",
    "trans": ScreenWidgetMessages.smArabic,
    "emoji": Emojis.flagSaudiArabia,
  },
  "def": {
    "label": "System Default",
    "trans": ScreenWidgetMessages.smSystemDefault,
    "emoji": Emojis.gear,
  },
};

final Map themeModeMap = {
  ThemeMode.system: ScreenWidgetMessages.smSelectTheme,
  ThemeMode.light: ScreenWidgetMessages.smLightTheme,
  ThemeMode.dark: ScreenWidgetMessages.smDarkTheme,
};

class ScreenSettingsModalBody extends StatelessWidget {
  ScreenSettingsModalBody({
    required this.onClose,
    required this.isModalOpen,
    required this.scrollController,
  });

  final VoidCallback onClose;
  final bool isModalOpen;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context, listen: false);

    return Material(
      textStyle: Theme.of(context).textTheme.bodyText1,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowGlow();
                return true;
              },
              child: ListView(
                controller: this.scrollController,
                // physics: isModalOpen
                //     ? AlwaysScrollableScrollPhysics()
                //     : NeverScrollableScrollPhysics(),
                children: [
                  Container(height: AppDimensions.padding * 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.padding * 2,
                        ),
                        child: Text(
                          App.translate(ScreenWidgetMessages.smTitle, context),
                          style: TextStyles.heading1,
                        ),
                      ),
                      IconButton(
                        key: Key(ScreenWidgetTestKeys.close),
                        icon: Icon(Icons.close),
                        onPressed: this.onClose,
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding * 2,
                    ),
                    child: Text(
                      App.translate(
                        ScreenWidgetMessages.smSelectLanguage,
                        context,
                      ),
                      style: TextStyles.heading3.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Container(height: AppDimensions.padding),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding * 2,
                    ),
                    child: Text(
                      "All the translatable messages are translated by an automated google translator script that's why you may see translation errors if you choose any language other than English And I won't improve translation since this is just an experimintal application also I work alone on this project. If you wish to improve translation do contact me, I'll mention your contribution in appllication and github repository.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(height: AppDimensions.padding),
                  ...[
                    null,
                    ...AppProvider.locales,
                  ].map(
                    (locale) {
                      final String key = locale?.languageCode ?? 'def';
                      return ScreenSettingsSelect(
                        onPress: () => appState.activeLocale = locale,
                        isActive: locale == appState.activeLocale,
                        textChild: DefaultTextStyle(
                          style: DefaultTextStyle.of(context).style.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                          child: Row(
                            children: [
                              Text(map[key]["emoji"]),
                              Container(width: AppDimensions.padding),
                              Text(map[key]["label"]),
                              Text(" - "),
                              Text(
                                App.translate(
                                  map[key]["trans"],
                                  context,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  Container(height: AppDimensions.padding),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding * 2,
                    ),
                    child: Text(
                      App.translate(
                          ScreenWidgetMessages.smSelectTheme, context),
                      style: TextStyles.heading3.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  ...ThemeMode.values.map(
                    (themeMode) => ScreenSettingsSelect(
                      onPress: () => appState.setTheme(themeMode),
                      isActive: themeMode == appState.themeMode,
                      text: App.translate(themeModeMap[themeMode], context),
                    ),
                  ),
                  Container(height: AppDimensions.padding * 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
