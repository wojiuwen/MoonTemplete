##功能说明  
模板化字符串
1.render render(template: String,data: Map[String, String]) -> String  
调用render模板化字符串  
let template = "Hello, {{ name }}! Welcome to {{ place }}."  
let data ={ "name": "Alice", "place": "Wonderland" }  
render(template,data)  
输出"Hello, Alice! Welcome to Wonderland  
