import { ArcScrollBar } from '@kit.ArkUI';

@Builder
export function HomeContentBuilder() {
  HomeContent();
}


@Component
struct NavigationButton {
  @Prop label: string
  @Require onCardClicked: () => void;

  build() {
    Button(this.label)
      .width('95%')
      .fontSize(14)
      .fontColor('#fffcf2')
      .backgroundColor('#0077b6')
      .borderRadius(5)
      .onClick(() => this.onCardClicked())
  }
}


@Component
struct HomeContent {
  @Consume('NavPathStack') private pageStack: NavPathStack;
  private scroller: Scroller = new Scroller()

  build() {
    Stack() {

      Scroll(this.scroller) {
        Column({ space: 20 }) {
          NavigationButton({
            label: 'ArcButton',
            onCardClicked: () => {
              this.pageStack.pushPathByName('ArcButtonPage', null);
            }
          })
          NavigationButton({
            label: 'ArcSlider',
            onCardClicked: () => {
              this.pageStack.pushPathByName('ArcSliderPage', null);
            }
          })
          NavigationButton({
            label: 'ArcScrollBar',
            onCardClicked: () => {
              this.pageStack.pushPathByName('ArcScrollBarPage', null);
            }
          })
          NavigationButton({
            label: 'ArcList',
            onCardClicked: () => {
              this.pageStack.pushPathByName('ArcListPage', null);
            }
          })
          NavigationButton({
            label: 'ArcAlphabetIndexer',
            onCardClicked: () => {
              this.pageStack.pushPathByName('ArcAlphabetIndexerPage', null);
            }
          })
          NavigationButton({
            label: 'ArcSwiper',
            onCardClicked: () => {
              this.pageStack.pushPathByName('ArcSwiperPage', null);
            }
          })
        }
        .padding(20)
        .alignItems(HorizontalAlign.Center)
      }
      .scrollBar(BarState.Off)
      .width('90%')

      ArcScrollBar({ scroller: this.scroller, state: BarState.Auto })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#1c0000')
    .alignContent(Alignment.Center)
  }
}