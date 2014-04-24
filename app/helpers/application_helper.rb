module ApplicationHelper

  def sanitize_kss_filename(filename)
    sanitized_filename = filename.split(".")[0].gsub!(/-/, '_') || filename.split(".")[0]
    sanitized_filename.slice!(0)
    return sanitized_filename
  end
  
end
