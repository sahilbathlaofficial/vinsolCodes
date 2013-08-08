def fibonacci
  limit = 1000
  print '0 1'
  yield(0,1,limit)
end
fibonacci do |first,second,limit|
 while (first + second) < 1000 
   print " #{first+second}"
   second = first + second
   first = second
 end 
end
