if @list.persisted?
  json.inserted_item render(partial: "lists/cards", formats: :html, locals: {list: @list})
else
  json.form render(partial: "lists/modal", formats: :html, locals: { list: @list })
end
