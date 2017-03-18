function type_hierarchy(t::DataType, level=0)
  println(" "^level, t)
  for x in subtypes(t)
    type_hierarchy(x, level+2)
  end
end

type_hierarchy(Number)
