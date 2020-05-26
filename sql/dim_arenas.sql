SELECT l.payload->>'arena_id' arena_id
     , l.payload->>'arena_name' arena_name

FROM {{prefix_logs}}logs l

WHERE event_type = 'arenaCreation'
