SELECT fr.fighter_name
     , CAST(SUM(fr.is_winner) AS FLOAT) / COUNT(DISTINCT fr.battle_id) win_rate

FROM {{prefix_models}}f_fighter_results fr

GROUP BY 1

ORDER BY 2 DESC
