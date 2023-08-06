json.status :ok

json.todoLists @todo_lists do |todo_list|
  json.id todo_list.id
  json.title todo_list.title
end
