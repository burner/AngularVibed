import vibe.d;
import weather;

interface MyAPI {
	// GET /weather -> responds {"text": "...", "temperature": ...}
	Weather getWeather();
}

class MyAPIImplementation : MyAPI {
	Weather getWeather() { return Weather("sunny", 25); }
}

shared static this() {
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];
	settings.options = HTTPServerOption.parseURL|HTTPServerOption.distribute;

	auto restsettings = new RestInterfaceSettings;
	restsettings.baseURL = URL("http://127.0.0.1:8080/");

	auto router = new URLRouter;
	router.get("/", staticTemplate!"index.dt");
	router.get("/main.html", staticTemplate!"main.dt");

	//
	// data_and_volume?sym=%d&start=%d&end=%s
	//
	//router.get("/myapi.js", serveRestJSClient!MyAPI(restsettings));
	router.registerRestInterface(new MyAPIImplementation, restsettings);

	router.get("*", serveStaticFiles("./public/"));
	listenHTTP(settings, router);
}
