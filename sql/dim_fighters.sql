SELECT l.payload->>'fighter_id' fighter_id
     , l.payload->>'fighter_name' fighter_name

FROM {{prefix_logs}}logs l

WHERE event_type = 'fighterCreation'
