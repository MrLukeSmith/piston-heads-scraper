# PistonHeads Car Details Scraper

This allows you to obtain details for a car, if they exist, using their Registration Number via the PistonHeads website. 

## How to use
* Clone the repo, and navigate to it. 
* bundle install
* ruby ph.rb "REGISTRATION"
* The results are outputted in the form of a JSON object

##JSON Output
    {"registration":"CE51AZB","year":"2001","make":"BMW","model":"E46 3 Series [98-06]","description":"BMW 3 SERIES (E46) 320CI 2001","type":"Convertible","doors":"2 Doors","colour":"Blue","transmission":"Manual","engine_position":"Front Engined","aspiration":"Normally Aspirated","cyclinders":"6 Cylinders","mpg":"30.1","torque":"155","bhp":"168","0to62":"9.1","top_speed":"138","drivetrain":"Rear Wheel Drive","previous_owners":"Up to 5 Owners"}

## Gems
* selenium-webdriver

## Disclaimer
I wrote this for fun, as a development exercise. This method of data collection isn't ideal for use in a production environment, but do with it what you will. 