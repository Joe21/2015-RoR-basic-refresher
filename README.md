# Menu Manager App

A sample rails app.


REQUEST | URI | DESCRIPTION
--- | --- | ---
GET | /api/v1/selections/index | Returns JSON of all menu selections
GET | /api/v1/selections/random_meal | Returns JSON of randomly created 3 course meal along with total cost and price of the randomized meal
POST | /api/v1/selections/random_meal_with | Upon successfully receiving POST request with a valid selection_id, returns JSON of randomly created 3 course meal built around the desired selection. Includes cost and price metrics as well.