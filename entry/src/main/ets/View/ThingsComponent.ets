import ThingsViewModel from "../ViewModel/ThingsViewModel";


@Component
export struct ThingsComponent {
  @Prop things: ThingsViewModel;


  @Builder
  displayIcon(icon: Resource) {
    Image(icon)
      .width(28)
      .height(28)
      .onClick(() => {
        this.things.updateIsFinish();
      })
  }


  build() {
    // 待办事项
    Row({ space: 15 }) {
      if(this.things.isFinish) {
        // 此处'app.media.finished'仅作示例，请开发者自行替换，否则imageSource创建失败会导致后续无法正常执行。
        this.displayIcon($r('app.media.finished'));
      } else {
        // 此处'app.media.unfinished'仅作示例，请开发者自行替换，否则imageSource创建失败会导致后续无法正常执行。
        this.displayIcon($r('app.media.unfinished'));
      }


      Text(`${this.things.thingsName}`)
        .fontSize(24)
        .fontWeight(450)
        .decoration({ type: this.things.isFinish ? TextDecorationType.LineThrough: TextDecorationType.None })
        .onClick(() => {
          this.things.addSuffixes();
        })
    }
    .height('8%')
    .width('90%')
    .padding({ left: 15 })
    .opacity(this.things.isFinish ? 0.3 : 1)
    .border({ width: 1 })
    .borderColor(Color.White)
    .borderRadius(25)
    .backgroundColor(Color.White)
  }
}