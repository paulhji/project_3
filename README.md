# Project 3: Using ETL Method to create a New York vehicle collision records datatbase.

## An overview of the project and its purpose
This project follows data engineering proccesses and uses an ETL workflow to transmit data from the NYPD on car collisons.
First we extrated the data from API endpoint provided by NYC Open Data.

[Webpage](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/about_data) 

[JSON](https://data.cityofnewyork.us/resource/h9gi-nx95.json)


The API was read into a python file using response request from the Pandas Library.

After being read in the data was cleaned and organized in the following manor.

1. Coloumns not applicable for our analysis were dropped using:
<code>columns_dropped_df=df.drop(['on_street_name','off_street_name', axis=1) </code>

2.Coloumns were renamed for simplicity.

3.Cells with NA values in the latitude, longitude and borough columns were dropped, so that only data with a full scope of location were kept.
<code> clean_data = columns_dropped_df.dropna(subset=['borough'] + ['latitude']+ ['longitude'])
clean_data</code>

4. Columns were renamed for simplicty, date and time columns were converterted to datetime format,
 finally column values with integers were converted to float64 and then remaining columns were converted to object(string)

5. Lastly rows with all zero values(in regard to injury or death) were removed, since no person, motrist, or cyclist was injured we dropped the data to keep just incidents with injuries.
<code>columns_to_check = ['persons_injured', 'persons_killed','pedestrians_injured', 'pedestrians_killed', 'cyclist_injured', 'cyclist_killed', 'motorist_injured', 'motorist_killed']</code>
<code>mask = (vehicle_data[columns_to_check] == 0).all(axis=1)</code>
<code>vehicle_data_filtered = vehicle_data[~mask]</code>

## Instructions on how to use and interact with the project



## At least one paragraph summarizing efforts for ethical considerations made in the project



## References for the data source(s)



## References for any code used that is not your own
