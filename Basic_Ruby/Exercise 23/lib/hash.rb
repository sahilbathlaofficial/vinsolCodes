class Hash
  def to_file(filename)
    hash = sort_by {|key| key}
    File.open(filename,File::RDWR|File::CREAT, 0644) do |file|
      begin
        file.flock(File::LOCK_EX)
        hash.each { |key,value| file.write "#{key}:\n#{value}" }
      ensure
        file.close
      end
    end
  end
end
