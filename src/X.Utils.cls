Class X.Utils
{

/// Converts a 16-byte string to an 8-byte string.
/// 
/// @param {String} input	16-byte string to convert
/// @returns {String}	8-byte string
/// 
/// @example
/// set Hash = $System.Encryption.MD5Hash("hello world")
/// write Hash // Illegible string & control characters
/// set ConvertedHash = ##class(X.Utils).Convert16ByteTo8Byte(Hash)
/// write ConvertedHash // 5EB63BBBE01EEED093CB22BB8F5ACDC3
ClassMethod Convert16ByteTo8Byte(input As %String = "") As %String
{
	set output = ""
	for i=1:1:$L(input) {
		set char = $ZH($A($E(input,i)))
		set output = output _ $S($L(char)=1 : "0" _ char, 1 : char)
	}
	quit output
}

/// Calculate the modulo of a and b, ie a%b in a lot of other languages
ClassMethod Modulo(a As %Integer, b As %Integer) As %Integer
{
	quit a - (b * (a\b))
}

/// Reverse an array
ClassMethod ReverseArray(in As %DynamicArray) As %DynamicArray
{
	set out = []
	set size = in.%Size()
	for i=size-1:-1:0 {
		do out.%Push(in.%Get(i))
	}
	quit out
}

}
