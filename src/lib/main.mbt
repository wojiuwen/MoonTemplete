fn main {
   let template = "Hello, {{ name }}! Welcome to {{ place }}."
   let data ={
      "name": "Alice",
      "place": "Wonderland"
   } 
   data.set("name", "Bob") // 插入或更新
   let result = render(template, data)
   println(result) // 输出: Hello, Bob! Welcome to Wonderland.
}