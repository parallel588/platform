module ApplicationHelper

  def sanitize_kss_filename(filename)
    return filename.split("_")[1].split(".")[0].gsub!(/-/, '_')
  end
  
end
