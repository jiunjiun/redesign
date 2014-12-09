module HomeHelper
  def project_css_path(project)
   "#{root_url}#{project.css_file}"
  end

  def star
    "btn-default"
    "btn-success" if @star.exists?
  end
end
