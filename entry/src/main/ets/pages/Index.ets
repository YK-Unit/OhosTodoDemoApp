import { common } from '@kit.AbilityKit';
// import ViewModel
import TodoListViewModel from '../ViewModel/TodoListViewModel';


// import View
import { TodoComponent } from '../View/TodoComponent';
import { AllChooseComponent } from '../View/AllChooseComponent';
import { TodoListComponent } from '../View/TodoListComponent';


@Entry
@Component
struct TodoList {
  @State thingsTodo: TodoListViewModel = new TodoListViewModel();
  private context = getContext(this) as common.UIAbilityContext;


  async aboutToAppear() {
    await this.thingsTodo.loadTasks(this.context);
  }


  build() {
    Column() {
      Row({ space: 40 }) {
        // 全部待办
        TodoComponent()
        //全选
        AllChooseComponent({ thingsViewModel: this.thingsTodo })
      }


      Column() {
        TodoListComponent({ thingsViewModelArray: this.thingsTodo.things })
      }
    }
    .height('100%')
    .width('100%')
    .margin({ top: 5, bottom: 5 })
    .backgroundColor('#90f1f3f5')
  }
}