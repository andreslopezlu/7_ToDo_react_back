if @succesfuly_created

  json.item do
    json.id @item.id
    json.description @item.description
    json.pending @item.pending
  end

else

  json.status do
    json.code 422
    json.message 'item could not be created.'
  end

  if @error
    json.error @error
  else
    json.errors @item.errors.full_messages.join(', ')
  end
end
