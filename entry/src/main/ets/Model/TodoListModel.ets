import { common } from '@kit.AbilityKit';
import util from '@ohos.util';
import ThingsModel from './ThingsModel';


export default class TodoListModel {
  things: Array<ThingsModel> = [];


  constructor(things: Array<ThingsModel>) {
    this.things = things;
  }


  async loadTasks(context: common.UIAbilityContext) {
    let getJson = await context.resourceManager.getRawFileContent('defaultTasks.json');
    let textDecoderOptions: util.TextDecoderOptions = { ignoreBOM: true };
    let textDecoder = util.TextDecoder.create('utf-8', textDecoderOptions);
    let result = textDecoder.decodeToString(getJson, { stream: false });
    this.things = JSON.parse(result);
  }
}