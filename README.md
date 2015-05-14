# Menu Manager App

Menu Manager is a RoR application I created to play around with rails. The premise was actually a quick demo to teach basic SQL to a friend but I figured I run with it and see where it can lead. Further details and documentation to come...

**Stack**
* Ruby 2.2.1 on Rails 4.2.1
* PostgreSQL DB
* Bootstrap SASS
* Omniauth-Facebook
* Simple Forms

**Functionality & Fun**
* CRUD functionality for selection model.
* Facebook authentication required to access Admin (Create, Edit, Delete) privileges.
* Namespaced RESTful routing.
* Decided to explore ways to avoid exposing database ID's on the URL for routing. The current structure overrides to_param to model name. 
	* This works for now but I'm not too thrilled breaking away from convention for this model across the entire app as it could seriously complicate interactions with other gems and scaleability. For future reference, something like FriendlyID gem sounds like a nice tool to look into.
* v1 API (for mobile devices)
	* So far v1 only allows for indexing all selections, generating a response of a fully randomized 3 course meal along with basic metrics, as well as accepting a POST request with a chosen selection and building a randomized 3 course meal around that selection.
	* For demonstrable purposes (use google POSTMAN) CSRF wasn't a priority but for production web this can be addressed in a number of ways (hidden input on application.html.erb, utilization of vallid_authenticity_token with session and request.header['X-XSRF-TOKEN'], etc.)


REQUEST | URI | DESCRIPTION
--- | --- | ---
GET | /api/v1/selections/index | Returns JSON of all menu selections
GET | /api/v1/selections/random_meal | Returns JSON of randomly created 3 course meal along with total cost and price of the randomized meal
POST | /api/v1/selections/random_meal_with | Upon successfully receiving POST request with a valid selection_id, returns JSON of randomly created 3 course meal built around the desired selection. Includes cost and price metrics as well.

**WIP Tasks***
* Back end validation
* Front end form validation
* Clean up CSS / SASS
* Redesign / improve forms (no formal design just proof of concept atm)
* Expand v1 api for mobile device
	* Decide on how client device will authenticate with backend omniauth-facebook
	* Build out full crud functionality via API
	* Build out validation
* TESTS! TESTS! TESTS!
* DevOps:
	* Create AWS micro instance
	* Create RDS instance
	* Set up alarms
	* Decide on deployment options: I've been anxious to play with beanstalk, already familiar with cap deploy scripts. Maybe try something more robust like TravisCI/Jenkins/Ansible/Docker.
	* Scale: Set up autoscaler, attach instances to load balancer
* Plan for CDN
* Implement image processor to house images instead of img_url
* Sync images to s3 bucket
* Implement responsive web design
* There are so many more ideas I'm almost inclined to start a new project with something more meaningful so stay tuned!