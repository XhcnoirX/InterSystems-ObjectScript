Class X.Utils
{

/// Converts a 16-byte string to an 8-byte string.
/// 
/// @param {String} Input	16-byte string to convert
/// @returns {String}	8-byte string
/// 
/// @example
/// Set Hash = $System.Encryption.MD5Hash("hello world")
/// Write Hash // Illegible string & control characters
/// Set ConvertedHash = ##class(X.Utils).Convert16ByteTo8Byte(Hash)
/// Write ConvertedHash // 5EB63BBBE01EEED093CB22BB8F5ACDC3
ClassMethod Convert16ByteTo8Byte(Input As %String = "") As %String
{
	Set Output = ""
	For I=1:1:$L(Input) {
		Set Chr = $ZH($A($E(Input,i)))
		Set Output = Output_$S($L(Chr)=1 : "0"_Chr, 1 : Chr)
	}
	Quit Output
}

/// Implements the Luhn algorithm for verifying if a number is potentially valid, or definitely invalid.
/// Used in for instance credit card number checks, bank account number checks.
/// 
/// @see https://en.wikipedia.org/wiki/Luhn_algorithm
/// 
/// @param {String|Number} Input	Number string to check
/// @return {Boolean}
/// 
/// @example
/// // Valid check digit - 3
/// Write ##class(X.Utils).Luhn("79927398713") // 1
/// // Invalid check digit - 4
/// Write ##class(X.Utils).Luhn("79927398714") // 0
ClassMethod Luhn(Input) As %Boolean
{
	Set Input = ""+Input
	If $L(Input)<2 Quit 1
	Set Sum = +$E(Input,*)
	Set Even = 1
	For I=$L(Input)-1:-1:1 {
		Set N = +$E(Input, I)
		If Even {
			Set N = 2*N
			If N>9 {
				Set Sum = Sum+1
				Set N = N-10
			}
		}
		Set Sum = Sum+N
		Set Even = 1-Even
	}
	Quit Sum#10=0
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
