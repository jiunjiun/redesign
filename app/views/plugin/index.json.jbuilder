json.styles @projects.each do |project|
  json.owner project.user.username
  json.name  project.name
  json.link  "#{root_url}#{project.user.username}/#{project.name}.css"
end
