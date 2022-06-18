enum Token {
	Symbol(a:String);
	Operator(a:String, order:Int);
	ParenthesisLeft(a:String);
	ParenthesisRight(a:String);
	EndOfLine;
}
