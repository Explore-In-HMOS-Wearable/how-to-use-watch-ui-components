import {
  LengthMetrics,
  LengthUnit,
  ArcButton,
  ArcButtonOptions,
  ArcButtonStatus,
  ArcButtonStyleMode,
  ArcButtonPosition,
} from '@kit.ArkUI';


@Builder
export function ArcButtonPageBuilder() {
  ArcButtonPage()
}

@ComponentV2
struct ArcButtonPage {
  @Local topOptions: ArcButtonOptions = new ArcButtonOptions({});
  @Local bottomOptions: ArcButtonOptions = new ArcButtonOptions({});

  aboutToAppear() {
    this.topOptions = new ArcButtonOptions({
      label: 'ButtonTop',
      status: ArcButtonStatus.NORMAL,
      position: ArcButtonPosition.TOP_EDGE,
      styleMode: ArcButtonStyleMode.EMPHASIZED_LIGHT,
      fontSize: new LengthMetrics(15, LengthUnit.FP),
      shadowEnabled: true
    })

    this.bottomOptions = new ArcButtonOptions({
      label: 'ButtonBottom',
      styleMode: ArcButtonStyleMode.EMPHASIZED_LIGHT,
      fontSize: new LengthMetrics(15, LengthUnit.FP),
      shadowEnabled: true,
      onClick: () => {
        console.info('click from ArcButton.');
      }
    })
  }

  build() {
    NavDestination() {
      Stack() {
        Stack() {
          Circle({ width: 233, height: 233 })
            .strokeWidth(0.1)
            .fill(Color.White)

          Column() {
            ArcButton({ options: this.topOptions })
            Blank()
            ArcButton({ options: this.bottomOptions })
          }.width('100%')
          .height('100%')
        }
        .width('100%')
        .height('100%')
      }.width('100%')
      .height('100%')
      .alignContent(Alignment.Center)
      .backgroundColor(Color.Gray)
    }
    .width($r('app.float.px_watch_size'))
    .height($r('app.float.px_watch_size'))
    .borderRadius($r('app.float.px_watch_radius'))
    .backgroundColor($r('app.color.background_color'))
    .hideTitleBar(true)
    .hideBackButton(true)
  }
}
