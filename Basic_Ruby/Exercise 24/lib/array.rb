class Array
  def reverse_iterate
    size_of_self = size
    for i in 1..size_of_self
      yield self[size_of_self - i]
    end
  end
end

