//
//  TaskListView.swift
//  TahDoodle
//
//  Created by Jonathan Paul on 4/6/21.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var taskStore: TaskStore
    
    var body: some View {
        List {
            ForEach(taskStore.tasks) { task in
                TaskView(title: task.title)
                    .contextMenu {
                        Button("Delete") {
                            taskStore.remove(task)
                        }
                    }
            }.onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    let task = taskStore.tasks[index]
                    taskStore.remove(task)
                }
            })
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(taskStore: .sample)
    }
}
