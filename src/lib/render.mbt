fn render(template: String, data: Map[String, String]) -> String {
	let out = StringBuilder::new()
	let mut i = 0
	let n = template.length()

	while i < n {
		if i + 1 < n && template[i] == '{' && template[i + 1] == '{' {
			let mut j = i + 2
			while j + 1 < n && !(template[j] == '}' && template[j + 1] == '}') {
				j += 1
			}

			if j + 1 < n {
				let key = template[i + 2 : j].trim().to_owned()
				match data.get(key) {
					Some(value) => out.write_string(value)
					None => out.write_string(template[i : j + 2].to_owned())
				}
				i = j + 2
			} else {
				out.write_string(template[i : n].to_owned())
				break
			}
		} else {
			out.write_string(template[i : i + 1].to_owned())
			i += 1
		}
	}
	out.to_string()
}
