import {Component} from 'angular2/core';
import { RouteConfig, RouterLink, RouterOutlet } from 'angular2/router';

@Component({
    selector: 'my-app',
    templateUrl: './main.html'
})
@RouteConfig([
	new Route({path: "/", component: AppComponent, name: "Index"}),
	new Route({path: "/todo", component: TodoComponent, name: "Todo"}),
])
export class AppComponent { 
	contructor(public router: Router, public location: Location) {
	}
}
