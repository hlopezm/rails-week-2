json.events @events do |event|
  json.(event, :name)

  json.user do
  json.email event.user.email
  end

end
