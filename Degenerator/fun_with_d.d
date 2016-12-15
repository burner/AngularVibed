/* The D Programming Language is a multi paradigm programming language
   * procedural
   * object oriented
   * functional
   * meta programming (compile time)
*/




/* procedural */

int fun(int a) {
	for(int i = 0; i < 10; ++i) {
		a += 1;
	}

	return a;
}

///
unittest {
	assert(fun(10) == 20);
}














// templates

T templateFun(T)(T t) {
	static if(is(T == int)) {
		return fun(t);
	} else static if(is(T == double)) {
		return t - 1.0;
	}
}

unittest {
	import std.math : approxEqual;

	assert(templateFun(10) == 20);

	assert(approxEqual(templateFun(1.0), 0.0));
}


// more template fun


T templateFun2(T)(T t) if(is(T == int)) {
		return t + 10;
}

T templateFun2(T)(T t) if(is(T == double)) {
		return t + 10.0;
}

unittest {
	assert(templateFun2(10) == 20);
	assert(templateFun2!(int)(10) == 20);

	{
		import std.math : approxEqual;
		assert(approxEqual(templateFun(1.0), 0.0));
		assert(approxEqual(templateFun!double(1.0), 0.0));
	}
}













/* Object Oriented */

class Base {
	int a;

	this(int a) {
		this.a = a;
	}

	int memberFun() const {
		return this.a + 10;
	}

	final void memberBar() {
		this.a += 10;
	}
}

class Deri : Base {
	this(int a) {
		super(a);
	}

	override int memberFun() const {
		return this.a + 20;
	}
}

unittest {
	auto b = new Base(10);
	assert(b.a == 10);
	assert(b.memberFun() == 20);
	b.memberBar();
	assert(b.a == 20);
}

unittest {
	Base d = new Deri(10);
	assert(d.memberFun() == 30);
}



















/** Compile time function execution */

unittest {
	enum rslt = fun(10);
	static assert(rslt == 20);
}

unittest {
	enum str = "int inc(int z) { 
		return z + 1; 
	}";

	mixin(str);
	
	assert(inc(1) == 2);
}

















// Functional

unittest {
	import std.stdio : writefln, writef, writeln;
	import std.file : readText;
	import std.algorithm.iteration : splitter, uniq;
	import std.algorithm.sorting : sort;
	import std.array : array;

	writefln("number unique words %d",
			readText(__FILE__)
				.splitter
				.array
				.sort
				.uniq
				.array
				.length);

	foreach(it; readText(__FILE__)
				.splitter
				.array
				.sort
				.uniq) {
		writef("%s ", it);
	}
	writeln();
}

// pure functions

immutable val = 1.0;

pure float pureFun(float a) {
	return a - val;
}

pure float pureFun2(float a) {
	return pureFun(a);
}

pure unittest {
	auto f = pureFun2(1.0);
}

float val2 = 2.0;

float purePain(float b) {
	return b - val2;
}

pure float purePain2(float b) {
	// return purePain(b); WILL NOT COMPILE
	assert(false);
}

unittest {
	float a = pureFun2(1.0);
}
















/** More Fun : Static Introspection */

struct S {
	int a;
	float b;
	string c;
}

string toJSON(T)(T t) {
	import std.array : appender;
	import std.format : formattedWrite;
	auto a = appender!string();

	formattedWrite(a, "{\n");

	foreach(mem; __traits(allMembers, T)) {
		formattedWrite(a, "\ttype : %s, value : %s,\n",
			mem, __traits(getMember, t, mem)
		);
	}
	formattedWrite(a, "}\n");

	return a.data;
}

unittest {
	import std.stdio;

	auto v = S(13, 0.37, "Hello World");
	writefln("\n%s", toJSON(v));
}






// Cleaning up
unittest {
	import std.stdio;

	void fun() {
	scope(exit) {
		writeln("scope exit");
	}

	{
		scope(success) {
			writeln("scope success");
		}
	}

	scope(failure) {
		writeln("scope failure");
	}

	throw new Exception("Exception");
	}

	try {
		fun();
	} catch(Exception e) {
		throw e;
	}
}
