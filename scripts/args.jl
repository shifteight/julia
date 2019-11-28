# 可以在一个函数中组合各种类型的参数
function all_the_args(normal_arg, optional_positional_arg=2; keyword_arg="foo")
    println("normal arg: $normal_arg")
    println("optional arg: $optional_positional_arg")
    println("keyword arg: $keyword_arg")
end
# => all_the_args (generic function with 2 methods)

all_the_args(1, 3, keyword_arg=4)
# => normal arg: 1
# => optional arg: 3
# => keyword arg: 4
