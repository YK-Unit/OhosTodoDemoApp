import ThingsViewModel from "../ViewModel/ThingsViewModel";
import { ThingsViewModelArray } from "../ViewModel/TodoListViewModel"
import { ThingsComponent } from "./ThingsComponent";


@Component
export struct TodoListComponent {
  @ObjectLink thingsViewModelArray: ThingsViewModelArray;


  build() {
    Column() {
      List() {
        ForEach(this.thingsViewModelArray, (item: ThingsViewModel) => {
          // 待办事项
          ListItem() {
            ThingsComponent({ things: item })
              .margin(5)
          }
        }, (item: ThingsViewModel) => {
          return item.thingsName;
        })
      }
    }
  }
}