SELECT l.payload->>'tournament_id' tournament_id
     , l.payload->>'tournament_name' tournament_name

FROM {{prefix_logs}}logs l

WHERE event_type = 'tournamentCreation'
