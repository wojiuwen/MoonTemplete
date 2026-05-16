///|
pub fn render(template : String, data : Map[String, String]) -> String {
  let out = StringBuilder::new()
  let mut i = 0
  let n = template.length()

  fn parse_tag(tag : String) -> (String, Option[String]) {
    let mut pipe_idx : Option[Int] = None
    let mut k = 0
    let len = tag.length()

    while k < len {
      if tag[k] == '|' {
        pipe_idx = Some(k)
        break
      }
      k += 1
    }

    match pipe_idx {
      Some(pi) => {
        let key = tag[0:pi].trim().to_owned()
        let rest = tag[pi + 1:len].trim()
        let default_prefix = "default("
          if rest.has_prefix(default_prefix) && rest.has_suffix(")") {
          let inner = rest[default_prefix.length():rest.length() - 1].trim()
          let is_quoted = inner.length() >= 2 &&((inner[0] == '"' && inner[inner.length() - 1] == '"')|| (inner[0] == '\'' && inner[inner.length() - 1] == '\''))
          let default_value = if is_quoted {
            inner[1:inner.length() - 1].to_owned()
          } else {
            inner.to_owned()
          }
          (key, Some(default_value))
        } else {
          (key, None)
        }
      }
      None => (tag.trim().to_owned(), None)
    }
  }

  while i < n {
    if i + 1 < n && template[i] == '{' && template[i + 1] == '{' {
      let mut j = i + 2
      while j + 1 < n && !(template[j] == '}' && template[j + 1] == '}') {
        j += 1
      }

      if j + 1 < n {
        let (key, default_value) = parse_tag(template[i + 2:j].trim().to_owned())
        match data.get(key) {
          Some(value) => out.write_string(value)
          None =>
            match default_value {
              Some(value) => out.write_string(value)
              None => out.write_string(template[i:j + 2].to_owned())
            }
        }
        i = j + 2
      } else {
        out.write_string(template[i:n].to_owned())
        break
      }
    } else {
      out.write_string(template[i:i + 1].to_owned())
      i += 1
    }
  }
  out.to_string()
}
