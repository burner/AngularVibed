struct Weather {
	string text;
	double temp;
}

void main() {
	foreach(it; __traits(allMembers, Weather)) {
		// ...
	}
}
