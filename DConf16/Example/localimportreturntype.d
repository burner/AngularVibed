void main() {
	auto someFile = getFile("file.txt");
	assert(someFile.isOpen());
}

auto getFile(string fn) {
	import std.stdio : File;
	return File(fn, "w");
}
