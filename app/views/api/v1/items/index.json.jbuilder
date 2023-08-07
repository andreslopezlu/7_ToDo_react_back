json.status :ok

json.todoList do
  json.id @todo_list.id
  json.title @todo_list.title
end

json.todos @items do |item|
  json.id item.id
  json.description item.description
  json.pending item.pending
end
