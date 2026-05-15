
pub fn render_file(input_path: String, data: Map[String, String]) -> Unit {
    let template = try {
        @fs.read_file_to_string(input_path)
    } catch {
        @fs.IOError(e) => {
            println("读取模板文件失败: " + e)
            return
        }
    }
    let result = render(template, data)
    try {
        @fs.write_string_to_file(input_path, result)
    } catch {
        @fs.IOError(e) => {
            println("写入模板文件失败: " + e)
        }
    }
}