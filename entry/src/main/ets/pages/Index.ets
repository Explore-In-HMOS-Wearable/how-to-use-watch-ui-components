import { HomeContentBuilder } from './HomeContent'
import { ArcAlphabetIndexerPageBuilder } from './ArcAlphabetIndexerPage'
import { ArcButtonPageBuilder } from './ArcButtonPage'
import { ArcSliderPageBuilder } from './ArcSliderPage'
import { ArcScrollBarPageBuilder } from './ArcScrollBarPage'
import { ArcListPageBuilder } from './ArcListPage'
import { ArcSwiperPageBuilder } from './ArcSwiperPage'

@Entry
@Component
struct Index {
  @Provide('NavPathStack') pageStack: NavPathStack = new NavPathStack()

  @Builder
  PageMap(name: string) {
    if (name === 'ArcButtonPage') {
      ArcButtonPageBuilder();
    } else if (name === 'ArcSliderPage') {
      ArcSliderPageBuilder();
    } else if (name === 'ArcScrollBarPage') {
      ArcScrollBarPageBuilder();
    } else if (name === 'ArcListPage') {
      ArcListPageBuilder();
    } else if (name === 'ArcAlphabetIndexerPage') {
      ArcAlphabetIndexerPageBuilder();
    } else if (name === 'ArcSwiperPage') {
      ArcSwiperPageBuilder();
    } else if (name === 'HomePage') {
      HomeContentBuilder();
    }
  }

  build() {
    Navigation(this.pageStack) {
      HomeContentBuilder()
    }
    .width($r('app.float.px_watch_size'))
    .height($r('app.float.px_watch_size'))
    .borderRadius($r('app.float.px_watch_radius'))
    .backgroundColor($r('app.color.background_color'))
    .mode(NavigationMode.Stack)
    .hideTitleBar(true)
    .hideBackButton(true)
    .ignoreLayoutSafeArea()
    .navDestination(this.PageMap)
  }
}
