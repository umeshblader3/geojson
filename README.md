# README

this application is about finding location information with the support of Geo map. Based on lattitude and longitude, information are being retrieved through open map api.

Technical Specification:

* Ruby version: *2.7.0*

* System dependencies: Linux distribution is utilized for development environment

* Configuration: Postgresql acts as database system and heroku is used for deployment purpose.

* Database creation: `bundle exec rake db:create`

* Database initialization: `bundle exec rake db:migrate`

## Application api end point
http method: GET method
Url path: **mains/api/v1/geojson**

url query parameters (Example):
```bash
{"lattitude": 51.53446389588336, "longitude": -0.13149261474609378}
```

response:
```json
{
    "type": "FeatureCollection",
    "features": [
        {
            "type": "Feature",
            "properties": {},
            "geometry": {
                "type": "Point",
                "coordinates": [
                    "51.53442045979156",
                    "-0.13152683407430135"
                ]
            }
        }
    ]
}
```

## Demo
Demo is available at https://openmap-sample.herokuapp.com/