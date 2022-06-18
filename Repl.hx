class Repl {
	static function main() {
		trace(new Lexer('dsfal', '+- */ ^').precedence_list);
	}
}
