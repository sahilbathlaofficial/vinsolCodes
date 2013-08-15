class Array
  def reverse_iterate
    for i in 1..size
      yield self[size - i]
    end
  end
end

