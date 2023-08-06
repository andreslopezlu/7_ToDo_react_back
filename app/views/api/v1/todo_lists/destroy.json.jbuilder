json.status :ok

json.todoList do
  json.id @todo_list.id
  json.title @todo_list.title
end
