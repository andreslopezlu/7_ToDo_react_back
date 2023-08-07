if @successfully_created

  json.status do
    json.code 200
    json.message 'todo list created successfully.'
  end

  json.todoList do
    json.id @todo_list.id
    json.title @todo_list.title
  end

else

  json.status do
    json.code 422
    json.message 'todo list could not be created.'
  end

  json.errors @todo_list.errors.full_messages.join(', ')

end
