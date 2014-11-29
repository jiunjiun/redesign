json.style @projects.each do |project|
  json.name project.name
  json.link "#{root_url}#{project.user.username}/#{project.name}.css"
end
