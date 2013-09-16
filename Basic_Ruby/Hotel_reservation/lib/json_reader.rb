require 'json'

module JSONReader
  def json_to_hash(filename)
    file_contents = ''
    dir = File.dirname($0)
    File.open(dir+"/"+filename, "r") do |file|
      begin
        file.flock(File::LOCK_SH)
        file_contents = file.read
      ensure
        file.close
      end
    end
    file_contents = JSON.parse(file_contents)
  end
end