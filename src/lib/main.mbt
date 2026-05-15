fn main {
    let template="Hello, {{name}}! Welcome to {{place}}{{abc}} {{cdf}}."
    let data = {
        "name": "Alice",
        "place": "Wonderland",
        "abc": "123",
        "cdf": "456"
    }
    let result = render(template, data)
    println(result)
}

