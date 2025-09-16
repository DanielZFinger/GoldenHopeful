create or replace view silver_activities as
select
    "Activity ID" as activity_id
  , to_timestamp("Activity Date", 'Mon DD, YYYY, HH12:MI:SS PM') as activity_date --convert from text to a timestamp
  , "Activity Name" as activity_name
  , "Activity Type" as activity_type
  , "Activity Description" as activity_description
  , concat(
        floor(replace(nullif("Elapsed Time", ''), ',', '')::numeric / 3600), 'h ',
        floor((replace(nullif("Elapsed Time", ''), ',', '')::numeric % 3600) / 60), 'm ',
        (replace(nullif("Elapsed Time", ''), ',', '')::numeric % 60)::int, 's'
    ) as elapsed_time_formatted --formatting the elapsed time to something easily readable Ex.'2hr15m7s'
  , replace(nullif("Elapsed Time", ''), ',', '')::numeric as elapsed_time
  , replace(nullif("Distance", ''), ',', '')::numeric as distance
  , replace(nullif("Max Heart Rate", ''), ',', '')::numeric as max_heart_rate
  , replace(nullif("Relative Effort", ''), ',', '')::int as relative_effort
  , "Commute" as commute
  , replace(nullif("Moving Time", ''), ',', '')::numeric as moving_time
  , replace(nullif("Max Speed", ''), ',', '')::numeric as max_speed
  , replace(nullif("Average Speed", ''), ',', '')::numeric as average_speed
  , replace(nullif("Elevation Gain", ''), ',', '')::numeric as elevation_gain
  , replace(nullif("Elevation Loss", ''), ',', '')::numeric as elevation_loss
  , replace(nullif("Elevation Low", ''), ',', '')::numeric as elevation_low
  , replace(nullif("Elevation High", ''), ',', '')::numeric as elevation_high
  , replace(nullif("Max Grade", ''), ',', '')::numeric as max_grade
  , replace(nullif("Average Grade", ''), ',', '')::numeric as average_grade
  , replace(nullif("Max Cadence", ''), ',', '')::numeric as max_cadence
  , replace(nullif("Average Cadence", ''), ',', '')::numeric as average_cadence
  , replace(nullif("Average Heart Rate", ''), ',', '')::numeric as average_heart_rate
  , replace(nullif("Max Watts", ''), ',', '')::numeric as max_watts
  , replace(nullif("Average Watts", ''), ',', '')::numeric as average_watts
  , replace(nullif("Calories", ''), ',', '')::numeric as calories
  , replace(nullif("Grade Adjusted Distance", ''), ',', '')::numeric as grade_adjusted_distance
from activities;

