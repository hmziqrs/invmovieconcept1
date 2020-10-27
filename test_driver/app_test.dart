import 'package:flutter_driver/flutter_driver.dart';
import 'package:invmovieconcept1/screens/AboutDeveloper/TestKeys.dart';
import 'package:invmovieconcept1/screens/Home/widgets/Drawer/data.dart';
import 'package:invmovieconcept1/screens/MovieDetail/TestKeys.dart';
import 'package:invmovieconcept1/screens/Reservation/TestKeys.dart';
import 'package:invmovieconcept1/screens/SelectSeats/TestKeys.dart';
import 'package:invmovieconcept1/widgets/Screen/TestKeys.dart';
import 'package:test/test.dart';

import 'package:invmovieconcept1/screens/Home/TestKeys.dart';

import 'screenshot.dart';
import 'actions.dart';
import 'utils.dart';

void main() async {
  group('Counter App', () {
    FlutterDriver driver;
    double width;
    double height;

    setUpAll(() async {
      driver = await FlutterDriver.connect();

      final platform = await driver.requestData("platform");
      final device = await driver.requestData("device");
      final dimensions = (await driver.requestData("dimensions")).split(",");

      width = double.parse(dimensions[0]);
      height = double.parse(dimensions[1]);

      Utils.driver = driver;
      TestActions.driver = driver;
      Screenshot.driver = driver;
      Screenshot.platform = platform;
      Screenshot.device = device;

      await Utils.init(platform);
      await TestActions.delay(1000);

      await driver.clearTimeline();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      await TestActions.delay(8000);

      driver?.close();
    });

    // test('Chunk testing', () async {
    //   await driver.runUnsynchronized(() async {
    //     await TestActions.delay(4000);
    //     print("CHUNK TESTING");
    //   });
    // }, timeout: Timeout.none);
    // return;
    final containerWidth = 540.0;

    Future<void> completeAppCycle() async {
      await TestActions.delay(1000);
      await Screenshot.screenshot("HomeScreen-1");

      final cardsScroll = width.clamp(
            100.0,
            containerWidth,
          ) *
          0.7;
      await TestActions.scroll(
        y: 0.0,
        x: -cardsScroll,
        scroller: HomeTestKeys.movieCardsBase,
      );
      await Screenshot.screenshot("HomeScreen-2");
      await TestActions.scroll(
        y: 0.0,
        x: -cardsScroll,
        scroller: HomeTestKeys.movieCardsBase,
      );
      await Screenshot.screenshot("HomeScreen-3");
      await TestActions.scroll(
        y: 0.0,
        x: -cardsScroll,
        scroller: HomeTestKeys.movieCardsBase,
      );
      await Screenshot.screenshot("HomeScreen-4");

      // MovieDetail
      await TestActions.tap(HomeTestKeys.getCard(3));
      await TestActions.delay(2000);
      await Screenshot.screenshot("MovieDetail-1");
      await TestActions.delay();
      await TestActions.scroll(
        x: 0.0,
        y: -900,
        scroller: MovieDetailTestKeys.scrollBody,
      );
      await Screenshot.screenshot("MovieDetail-2");
      await TestActions.tap(MovieDetailTestKeys.selectSeats);

      // Select Seats
      await TestActions.delay(2000);
      await Screenshot.screenshot("SelectSeats-1");
      await TestActions.tap(SelectSeatsTestKeys.getDay(3));
      await TestActions.tap(SelectSeatsTestKeys.getTime(2));
      await TestActions.tap(SelectSeatsTestKeys.getSeat(3, 0));
      await TestActions.tap(SelectSeatsTestKeys.getSeat(3, 1));
      await TestActions.tap(SelectSeatsTestKeys.getSeat(7, 1));
      await TestActions.tap(SelectSeatsTestKeys.getSeat(6, 2));
      await Screenshot.screenshot("SelectSeats-2");
      await TestActions.tap(SelectSeatsTestKeys.buyNow);

      // Book Now
      await Screenshot.screenshot("Reservation-1");
      await TestActions.tap(ReservationTestKeys.bookNow);
      await Screenshot.screenshot("Reservation-2");
      await TestActions.tap(ReservationTestKeys.ok);

      // Drawer
      await TestActions.tap(HomeTestKeys.searchButton);
      await Screenshot.screenshot("Search-1");
      await TestActions.goBack();

      // Drawer
      await TestActions.tap(HomeTestKeys.drawerButton);
      await Screenshot.screenshot("Drawer-1");

      // Developer
      await TestActions.tap(NavigationKey.developer.toString());
      await TestActions.delay(3000);
      await Screenshot.screenshot("AboutDeveloper-1");
      await TestActions.scroll(
        x: 0.0,
        y: -height,
        scroller: AboutDeveloperTestKeys.rootScroll,
      );
      await Screenshot.screenshot("AboutDeveloper-2");
      await TestActions.scroll(
        x: 0.0,
        y: -height,
        scroller: AboutDeveloperTestKeys.rootScroll,
      );
      await Screenshot.screenshot("AboutDeveloper-3");
      await TestActions.goBack();

      // Designer
      await TestActions.tap(HomeTestKeys.drawerButton);
      await TestActions.tap(NavigationKey.designer.toString());
      await TestActions.delay(3000);
      await Screenshot.screenshot("AboutDesigner-1");
      await TestActions.goBack();

      // Download
      await TestActions.tap(HomeTestKeys.drawerButton);
      await TestActions.tap(NavigationKey.download.toString());
      await Screenshot.screenshot("Download-1");
      await TestActions.goBack();

      // My Movies
      await TestActions.tap(HomeTestKeys.drawerButton);
      await TestActions.tap(NavigationKey.movies.toString());
      await Screenshot.screenshot("MyMovies-1");
      await TestActions.goBack();

      // AppSettings
      await TestActions.tap(HomeTestKeys.drawerButton);
      await TestActions.tap(NavigationKey.settings.toString());
      await Screenshot.screenshot("AppSettings-1");
      await TestActions.tap(ScreenWidgetTestKeys.close);
      await TestActions.delay(2000);
    }

    test(
      'ScreenShots',
      () async {
        await driver.runUnsynchronized(() async {
          Screenshot.theme = "light";
          await TestActions.delay(2000);
          await TestActions.tap(HomeTestKeys.drawerButton);
          await TestActions.tap(NavigationKey.settings.toString());
          await TestActions.delay(2000);
          await TestActions.scroll(
            x: 0.0,
            y: -height,
            scroller: ScreenWidgetTestKeys.rootScroll,
          );
          await TestActions.tap(ScreenWidgetTestKeys.lightTheme);
          await TestActions.scroll(
            x: 0.0,
            y: height,
            scroller: ScreenWidgetTestKeys.rootScroll,
          );
          await TestActions.tap(ScreenWidgetTestKeys.close);
          await completeAppCycle();
          await TestActions.scroll(
            y: 0.0,
            x: height * 3,
            scroller: HomeTestKeys.movieCardsBase,
          );

          Screenshot.theme = "dark";
          await TestActions.delay(2000);
          await TestActions.tap(HomeTestKeys.drawerButton);
          await TestActions.tap(NavigationKey.settings.toString());
          await TestActions.delay(2000);
          await TestActions.scroll(
            x: 0.0,
            y: -height,
            scroller: ScreenWidgetTestKeys.rootScroll,
          );
          await TestActions.tap(ScreenWidgetTestKeys.darkTheme);
          await TestActions.scroll(
            x: 0.0,
            y: height,
            scroller: ScreenWidgetTestKeys.rootScroll,
          );
          await TestActions.tap(ScreenWidgetTestKeys.close);
          await completeAppCycle();
        });
      },
      timeout: Timeout.none,
    );
  });
}
