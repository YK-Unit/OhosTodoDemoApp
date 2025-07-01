import ThingsModel from "../Model/ThingsModel";


@Observed
export default class ThingsViewModel {
  @Track thingsName: string = 'Todo';
  @Track isFinish: boolean = false;


  updateTask(things: ThingsModel) {
    this.thingsName = things.thingsName;
    this.isFinish = things.isFinish;
  }


  updateIsFinish(): void {
    this.isFinish = !this.isFinish;
  }


  addSuffixes(): void {
    this.thingsName += '啦';
  }
}