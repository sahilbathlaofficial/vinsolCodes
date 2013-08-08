def fibonacci
  print "0 1"
  first = 0
  second = 1
  while (first + second) < 1000
    third = first + second
    yield(third)
    first = second
    second = third
  end
end
fibonacci {|sum| print " #{sum}"}

