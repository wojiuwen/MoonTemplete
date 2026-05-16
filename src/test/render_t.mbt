test "render 替换变量" {
  let template = "Hello, {{name}}! Welcome to {{place}}."
  let data = { "name": "Alice", "place": "Wonderland" }
  let result = @Lib.render(template, data)
  assert_eq(result, "Hello, Alice! Welcome to Wonderland.")
}

test "render 未知变量保留原样" {
  let template = "Hello, {{name}}! Welcome to {{unknown}}."
  let data = { "name": "Alice" }
  let result = @Lib.render(template, data)
  assert_eq(result, "Hello, Alice! Welcome to {{unknown}}.")
}

test "render 多变量" {
  let template = "{{a}},{{b}},{{c}}"
  let data = { "a": "1", "b": "2", "c": "3" }
  let result = @Lib.render(template, data)
  assert_eq(result, "1,2,3")
}

test "render 默认值缺省" {
  let template = "Hello, {{name | default('unknown')}}!"
  let data = {}
  let result = @Lib.render(template, data)
  assert_eq(result, "Hello, unknown!")
}

test "render 默认值有值" {
  let template = "Hello, {{name | default('unknown')}}!"
  let data = {"name": "Bob"}
  let result = @Lib.render(template, data)
  assert_eq(result, "Hello, Bob!")
}

test "render 多默认值混合" {
  let template = "{{a | default('A')}}-{{b | default('B')}}-{{c | default('C')}}"
  let data = {"b": "BB"}
  let result = @Lib.render(template, data)
  assert_eq(result, "A-BB-C")
}
