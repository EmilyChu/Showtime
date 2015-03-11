json.array! @movies do |m|
  json.title        m.title
  json.rating       m.rating
  json.description  m.description
end