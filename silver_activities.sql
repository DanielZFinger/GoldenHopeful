CREATE or replace VIEW silver_activities AS
select
    "Activity ID" as activity_id
    ,TO_TIMESTAMP("Activity Date", 'Mon DD, YYYY, HH12:MI:SS PM') as activity_date
FROM activities
