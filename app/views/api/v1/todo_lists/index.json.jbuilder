json.status do
  json.code 200
  json.message 'todo lists retrieved successfully.'
end

json.todoLists @todo_lists do |todo_list|
  json.id todo_list.id
  json.title todo_list.title
end
