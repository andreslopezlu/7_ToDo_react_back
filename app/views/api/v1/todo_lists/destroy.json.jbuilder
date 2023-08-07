if @successfully_deleted

  json.status do
    json.code 200
    json.message 'todo list deleted successfully.'
  end

else

  json.status do
    json.code 422
    json.message 'todo list could not be deleted.'
  end

  if @error
    json.error @error
  else
    json.errors @todo_list.errors.full_messages.join(', ')
  end
end
