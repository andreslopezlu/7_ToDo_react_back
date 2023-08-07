json.todo do
  json.id @item.id
  json.description @item.description
  json.pending @item.pending
end
