CREATE or replace VIEW silver_activities AS
select
    "Activity ID" as activity_id
    , TO_TIMESTAMP("Activity Date", 'Mon DD, YYYY, HH12:MI:SS PM') as activity_date --convert from text to a timestamp
    , "Activity Name" as activity_name
    , "Activity Type" as activity_type
    , "Activity Description" as activity_description
    , CONCAT(
	    FLOOR("Elapsed Time"::numeric / 3600), 'h ',
	    FLOOR(("Elapsed Time"::numeric % 3600) / 60), 'm ',
	    ("Elapsed Time"::numeric % 60)::int, 's'
	) AS elapsed_time_formatted --formatting the elapsed time to something easily readable Ex.'2hr15m7s'
	, "Elapsed Time"::numeric as elapsed_time
FROM activities
