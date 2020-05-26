WITH battles AS (

  SELECT l.payload->>'tournament_id' tournament_id
       , l.payload->>'battle_id' battle_id
       , l.payload->>'arena_id' arena_id
       , l.payload->>'fighter1_id' fighter1_id
       , l.payload->>'fighter2_id' fighter2_id
       , l.payload->>'winner_id' winner_id

  FROM {{prefix_logs}}logs l

  WHERE event_type = 'battleCreation'
)

SELECT t.tournament_name
     , t.tournament_name || '-' || CAST(b.battle_id AS VARCHAR) battle_id
     , a.arena_name
     , f1.fighter_name fighter1_name
     , f2.fighter_name fighter2_name
     , w.fighter_name winner_name

FROM battles b

LEFT JOIN {{prefix_models}}dim_tournaments t
  ON b.tournament_id = t.tournament_id

LEFT JOIN {{prefix_models}}dim_arenas a
  ON b.arena_id = a.arena_id

LEFT JOIN {{prefix_models}}dim_fighters f1
  ON b.fighter1_id = f1.fighter_id

LEFT JOIN {{prefix_models}}dim_fighters f2
  ON b.fighter2_id = f2.fighter_id

LEFT JOIN {{schema_models}}.dim_fighters w
  ON b.winner_id = w.fighter_id
