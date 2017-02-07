json.array!(@members) do |member|
  json.extract! member, :id, :numero, :nombre, :email, :fechaNacimiento, :presidente
  json.url member_url(member, format: :json)
end
