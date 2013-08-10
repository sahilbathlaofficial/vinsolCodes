def fibonacci
  print "0 1"
  second_last = 0
  last = 1
  while (new_last = second_last + last) < 1000
    yield(new_last)
    second_last = last
    last = new_last
  end
end
fibonacci {|new_last| print " #{new_last}"}

