fn main {
    let template = "Hello, {{name}}! Welcome to {{place}}. Your code: {{code | default('unknown')}}."
    
    let data1 = {"name": "Alice", "place": "Wonderland"}
    let result1 = render(template, data1)
    println(result1) // 期望: Hello, Alice! Welcome to Wonderland. Your code: unknown.

    // 2. code 有值
    let data2 = {"name": "Alice", "place": "Wonderland", "code": "A123"}
    let result2 = render(template, data2)
    println(result2) // 期望: Hello, Alice! Welcome to Wonderland. Your code: A123.

    // 3. name 缺省
    let data3 = {"place": "Moon", "code": "B456"}
    let result3 = render(template, data3)
    println(result3) // 期望: Hello, {{name}}! Welcome to Moon. Your code: B456.
}

