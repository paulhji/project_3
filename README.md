# Project 3: Using ETL Method to create a New York vehicle collision records datatbase.

## An overview of the project and its purpose
This project follows data engineering proccesses and uses an ETL workflow to transmit data from the NYPD on car collisons.
First we extrated the data from API endpoint provided by NYC Open Data.

[Webpage](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/about_data) 

[JSON](https://data.cityofnewyork.us/resource/h9gi-nx95.json)


The API was read into a python file using response request from the Pandas Library.

After being read in the data was cleaned and organized in the following manor.

1. Coloumns not applicable for our analysis were dropped using:
<code>columns_dropped_df=df.drop(['on_street_name','off_street_name','cross_street_name',
       'location', 'cross_street_name','contributing_factor_vehicle_4','vehicle_type_code_4',
       'contributing_factor_vehicle_5', 'vehicle_type_code_5', 'zip_code']
       , axis=1)
</code>

2.Coloumns were renamed for simplicity.

3. 


## Instructions on how to use and interact with the project



## At least one paragraph summarizing efforts for ethical considerations made in the project



## References for the data source(s)



## References for any code used that is not your own
