update patients set adverse_event_reported = 0;
update patients set adverse_event_reported = 1 where id in (4, 49, 59,60,61,63, 93,95);

update patients set similar_problems_in_family = 0;


