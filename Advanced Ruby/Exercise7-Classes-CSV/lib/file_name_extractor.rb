module FileNameExtractor
  def extract_file_name(file_path)
    file_path.split("/")[-1].split('.')[0]
  end
end