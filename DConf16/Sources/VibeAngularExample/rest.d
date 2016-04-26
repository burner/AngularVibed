import vibe.core.core;
import vibe.core.log;
import vibe.http.router;
import vibe.http.server;
import vibe.web.rest;

struct Weather {
	string text;
	double temperature; // C
}

interface MyAPI {
	// GET /weather -> responds {"text": "...", "temperature": ...}
	Weather getWeather();

	// PUT /location -> accepts {"location": "..."}
	@property void location(string location);

	// GET /location -> responds "..."
	@property string location();
}

class MyAPIImplementation : MyAPI {
	private {
		string m_location;
	}

	Weather getWeather() { return Weather("sunny", 25); }

	@property void location(string location) { m_location = location; }
	@property string location() { return m_location; }
}

shared static this() {
	auto router = new URLRouter;
	router.get("/", staticTemplate!"index.dt");
	router.registerRestInterface(new MyAPIImplementation);

	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.options = HTTPServerOption.parseURL|HTTPServerOption.distribute;
	listenHTTP(settings, router);
}
