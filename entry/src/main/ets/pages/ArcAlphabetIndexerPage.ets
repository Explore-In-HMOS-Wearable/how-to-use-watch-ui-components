import {
  LengthMetrics,
  ColorMetrics,
  ArcList,
  ArcListItem,
  ArcListAttribute,
  ArcAlphabetIndexer,
  ArcAlphabetIndexerAttribute
} from '@kit.ArkUI';


@Builder
export function ArcAlphabetIndexerPageBuilder() {
  ArcAlphabetIndexerPage()
}

@Component
struct ArcAlphabetIndexerPage {
  private fullValue: string[] = [
    '#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  ]
  private arrName: string[] = [
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
    '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38',
    '39', '40', '41', '42'
  ]
  private scrollerForList: Scroller = new Scroller();
  @State indexerIndex: number = 0;
  private itemSize: number = 24;

  build() {
    NavDestination() {
      Column() {
        Row() {
          Stack() {
            ArcList({ scroller: this.scrollerForList, initialIndex: 0 }) {
              ForEach(this.arrName, (itemName: string, index: number) => {
                ArcListItem() {
                  Text(itemName)
                    .width('90%')
                    .height('92px')
                    .fontColor(Color.Black)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .backgroundColor(index % 2 == 0 ? 0xAFEEEE : 0x00FFFF)
                    .borderRadius(23)
                }
              }, (itemName: string, index: number) => itemName)
            }
            .scrollBar(BarState.Off)
            .onScrollIndex((firstIndex: number, lastIndex: number, centerIndex: number) => {
              this.indexerIndex = centerIndex;
            })
            .borderWidth(1)
            .width($r('app.float.px_watch_size'))
            .height($r('app.float.px_watch_size'))
            .borderRadius($r('app.float.px_watch_radius'))
            .space(LengthMetrics.px(4))

            ArcAlphabetIndexer({ arrayValue: this.fullValue, selected: 0 })
              .autoCollapse(true)
              .width($r('app.float.px_watch_size'))
              .height($r('app.float.px_watch_size'))
              .usePopup(false)
              .selected(this.indexerIndex)
              .onSelect((index: number) => {
                this.indexerIndex = index;
                this.scrollerForList.scrollToIndex(this.indexerIndex);
              })
              .borderWidth(1)
              .hitTestBehavior(HitTestMode.Transparent)
              .selectedColor(ColorMetrics.resourceColor(0xFFFFFF))
              .selectedBackgroundColor(ColorMetrics.resourceColor(0x1F71FF))
              .color(ColorMetrics.resourceColor(0xFFFFFF))
              .popupColor(ColorMetrics.resourceColor(0xFFFFFF))
              .popupBackground(ColorMetrics.resourceColor(0xD8404040))
              .itemSize(LengthMetrics.px(this.itemSize))
              .selectedFont({
                size: '11.0fp',
                style: FontStyle.Normal,
                weight: 500,
                family: 'HarmonyOS Sans'
              })
              .font({
                size: '11.0fp',
                style: FontStyle.Normal,
                weight: 500,
                family: 'HarmonyOS Sans'
              })

          }.width('100%').height('100%')
        }.width('100%').height('100%')
      }
    }
    .borderRadius($r('app.float.px_watch_radius'))
    .backgroundColor($r('app.color.background_color'))
    .hideTitleBar(true)
    .hideBackButton(true)
  }
}