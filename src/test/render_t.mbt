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
