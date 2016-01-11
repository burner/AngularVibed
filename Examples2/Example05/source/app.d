import vibe.d;

shared static this() {
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];
	auto router = new URLRouter;
	router.get("/", staticTemplate!"index.dt");
	router.get("/main.html", staticTemplate!"main.dt");
	router.get("*", serveStaticFiles("./public"));
	listenHTTP(settings, router);

	logInfo("Please open http://127.0.0.1:8080/ in your browser.");
}
