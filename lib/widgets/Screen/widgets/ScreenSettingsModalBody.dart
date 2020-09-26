import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/providers/AppProvider.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/App.dart';

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
  ScreenSettingsModalBody({@required this.onClose});
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context, listen: false);

    return SafeArea(
      child: Material(
        textStyle: Theme.of(context).textTheme.bodyText1,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: AppDimensions.padding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.padding * 4,
                  ),
                  child: Text(
                    App.translate(ScreenWidgetMessages.smTitle, context),
                    style: TextStyles.heading1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.padding,
                  ),
                  child: IconButton(
                    key: Key(ScreenWidgetTestKeys.close),
                    icon: Icon(Icons.close),
                    onPressed: this.onClose,
                  ),
                )
              ],
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                    top: AppDimensions.padding,
                    left: AppDimensions.padding * 4,
                    right: AppDimensions.padding * 4,
                  ),
                  child: GestureDetector(
                    onDoubleTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          App.translate(
                            ScreenWidgetMessages.smSelectLanguage,
                            context,
                          ),
                          style: TextStyles.heading3.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Container(height: AppDimensions.padding),
                        Text(
                          "All the translatable messages are translated by an automated google translator script that's why you may see translation errors if you choose any language other than English And I won't improve translation since this is just an experimintal application also I work alone on this project. If you wish to improve translation do contact me, I'll mention your contribution in appllication and github repository.",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(height: AppDimensions.padding),
                        ...[
                          null,
                          ...AppProvider.locales,
                        ].map(
                          (locale) {
                            final key = locale?.languageCode ?? 'def';
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                  vertical: AppDimensions.padding * 1,
                                ),
                                child: InkWell(
                                  onTap: () => appState.activeLocale = locale,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      AppDimensions.padding * 2.4,
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
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        Text(
                          App.translate(
                              ScreenWidgetMessages.smSelectTheme, context),
                          style: TextStyles.heading3.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        ...ThemeMode.values.map(
                          (themeMode) => GestureDetector(
                            onTap: () => appState.setTheme(themeMode),
                            child: Container(
                              margin: EdgeInsets.only(
                                top: AppDimensions.padding,
                              ),
                              width: double.infinity,
                              child: InkWell(
                                onTap: () => appState.setTheme(themeMode),
                                child: Container(
                                  color: themeMode == appState.themeMode
                                      ? Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .color
                                          .withOpacity(0.08)
                                      : Colors.transparent,
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppDimensions.padding * 2,
                                    horizontal: AppDimensions.padding * 2.4,
                                  ),
                                  child: Text(
                                    App.translate(
                                        themeModeMap[themeMode], context),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(height: AppDimensions.padding * 3),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
