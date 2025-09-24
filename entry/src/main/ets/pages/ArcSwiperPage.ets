import {
  CircleShape,
  ArcSwiper,
  ArcSwiperAttribute,
  ArcDotIndicator,
  ArcDirection,
  ArcSwiperController
} from '@kit.ArkUI';

class MyDataSource implements IDataSource {
  private list: Color[] = [];

  constructor(list: Color[]) {
    this.list = list;
  }

  totalCount(): number {
    return this.list.length;
  }

  getData(index: number): Color {
    return this.list[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Builder
export function ArcSwiperPageBuilder() {
  ArcSwiperPage()
}

@Component
struct ArcSwiperPage {
  @State itemSimpleColor: Color | number | string = '';
  @State selectedItemSimpleColor: Color | number | string = '';
  private wearableSwiperController: ArcSwiperController = new ArcSwiperController();
  private arcDotIndicator: ArcDotIndicator = new ArcDotIndicator();
  private data: MyDataSource = new MyDataSource([]);
  @State backgroundColors: Color[] = [
    Color.Green,
    Color.Blue,
    Color.Yellow,
    Color.Pink,
    Color.White,
    Color.Gray,
    Color.Orange,
    Color.Transparent
  ];
  innerSelectedIndex: number = 0;

  aboutToAppear(): void {
    let list: Color[] = [];
    for (let i = 1; i <= 6; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(this.backgroundColors);
  }

  build() {
    NavDestination() {
      Column() {
        Row() {
          ArcSwiper(this.wearableSwiperController) {
            LazyForEach(this.data, (backgroundColor: Color, index: number) => {
              Text(index.toString())
                .width(233)
                .height(233)
                .backgroundColor(backgroundColor)
                .textAlign(TextAlign.Center)
                .fontSize(30)
                .borderRadius(150)
            })
          }
          .clipShape(new CircleShape({ width: 233, height: 233 }))
          .effectMode(EdgeEffect.Spring)
          .backgroundColor(Color.Transparent)
          .index(0)
          .duration(400)
          .vertical(false)
          .indicator(this.arcDotIndicator
            .arcDirection(ArcDirection.SIX_CLOCK_DIRECTION)
            .itemColor(this.itemSimpleColor)
            .selectedItemColor(this.selectedItemSimpleColor)
          )
          .disableSwipe(false)
          .digitalCrownSensitivity(CrownSensitivity.MEDIUM)
          .onChange((index: number) => {
            console.info('onChange:' + index.toString());
          })
          .onAnimationStart((index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => {
            this.innerSelectedIndex = targetIndex;
            console.info('targetIndex: ' + targetIndex);
            console.info('current offset: ' + extraInfo.currentOffset);
            console.info('target offset: ' + extraInfo.targetOffset);
            console.info('velocity: ' + extraInfo.velocity);
          })
          .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
            others: Array<GestureRecognizer>): GestureJudgeResult => {
            if (current) {
              let target = current.getEventTargetInfo();
              if (target && current.isBuiltIn() && current.getType() == GestureControl.GestureType.PAN_GESTURE) {
                let swiperTarget = target as ScrollableTargetInfo
                if (swiperTarget instanceof ScrollableTargetInfo &&
                  (swiperTarget.isBegin() || this.innerSelectedIndex === 0)) {
                  let panEvent = event as PanGestureEvent;
                  if (panEvent && panEvent.offsetX > 0 && (swiperTarget.isBegin() || this.innerSelectedIndex === 0)) {
                    return GestureJudgeResult.REJECT;
                  }
                }
              }
            }
            return GestureJudgeResult.CONTINUE;
          })
          .onAnimationEnd((index: number, extraInfo: SwiperAnimationEvent) => {
            console.info('index: ' + index);
            console.info('current offset: ' + extraInfo.currentOffset);
          })
          .disableTransitionAnimation(false)
        }.height('100%')
      }.width('100%')
    }
    .borderRadius($r('app.float.px_watch_radius'))
    .backgroundColor($r('app.color.background_color'))
    .hideTitleBar(true)
    .hideBackButton(true)
  }
}