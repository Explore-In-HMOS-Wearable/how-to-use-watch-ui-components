import { ComponentContent, LengthMetrics } from '@kit.ArkUI';
import { UIContext } from '@kit.ArkUI';
import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute } from '@kit.ArkUI';

@Builder
export function ArcListPageBuilder() {
  ArcListPage()
}

@Builder
function buildText() {
  Column() {
    Text('Wearable UI')
      .fontSize('45px')
      .fontWeight(FontWeight.Bold)
  }
}

@Component
struct ArcListPage {
  @State private numItems: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  context: UIContext = this.getUIContext()
  tabBar1: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(buildText));

  @Builder
  buildList2() {
    Stack() {
      ArcList({ initialIndex: 0, header: this.tabBar1 }) {
        ForEach(this.numItems, (item: number, index: number) => {
          ArcListItem() {
            Button('' + item, { type: ButtonType.Capsule })
              .width($r('app.float.list_item_size'))
              .height('100px')
              .fontSize('40px')
              .focusable(true)
              .focusOnTouch(true)
              .backgroundColor(0x17A98D)
          }.align(Alignment.Center)

        }, (item: string, index: number) => item + index)
      }
      .space(LengthMetrics.px(10))
      .borderRadius($r('app.float.px_watch_size'))
      .focusable(true)
      .focusOnTouch(true)
      .defaultFocus(true)
    }
    .align(Alignment.Center)
    .width($r('app.float.px_watch_size'))
    .height($r('app.float.px_watch_size'))
    .border({ color: Color.Black, width: 1 })
    .borderRadius($r('app.float.px_watch_radius'))
  }

  build() {
    NavDestination() {
      Column() {
        this.buildList2()
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
    }
    .borderRadius($r('app.float.px_watch_radius'))
    .backgroundColor($r('app.color.background_color'))
    .hideTitleBar(true)
    .hideBackButton(true)
  }
}