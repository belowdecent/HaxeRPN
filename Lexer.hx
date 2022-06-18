class Lexer {
	var text:String;
	var pos:Int;
	var char_code:Int;

	public var precedence_list:Map<String, Int>;

	public function new(text:String, operators:String) {
		this.text = text;
		this.pos = 0;
		this.char_code = this.text.charCodeAt(0);
		this.precedence_list = new Map();

		var precedence_count = 0;

		for (group in operators.split(' ')) {
			for (operand in group.split('')) {
				precedence_list.set(operand, precedence_count);
			}
			precedence_count += 1;
		}
	}

	public function nextToken() {
		switch char_code {
			case ' '.code:
				while (char_code == ' '.code)
					advance();
				return nextToken();
			case '('.code | '['.code | '{'.code:
				advance();
				return Token.ParenthesisLeft(String.fromCharCode(char_code));
			case ')'.code | ']'.code | '}'.code:
				advance();
				return Token.ParenthesisRight(String.fromCharCode(char_code));
			case '+'.code:
				return Token.EndOfLine;
			case _:
				return null;
		}
	}

	function advance() {
		pos += 1;
		char_code = text.charCodeAt(pos);
	}
}
