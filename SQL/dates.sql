WITH game_summary AS
(
    SELECT
        DISTINCT game_start_ts::date dt
        ,DATE_PART('year', game_start_ts)::int||' - Week '||DATE_PART('week', game_start_ts) wk
        ,user_id
        ,game_id
        ,player_god_name
        ,total_turn_qty
        ,game_end_ts - game_start_ts game_time
        ,player_won_indc
        ,player_started_indc
    FROM player_game_event pge
    GROUP BY
        game_start_ts::date
        ,DATE_PART('year', game_start_ts)::int||' - Week '||DATE_PART('week', game_start_ts)
        ,user_id
        ,game_id
        ,player_god_name
        ,total_turn_qty
        ,game_time
        ,player_won_indc
        ,player_started_indc
)

-- Which week had the highest number of games?
SELECT
    COUNT(DISTINCT game_id) game_count
    ,wk
FROM
    game_summary
GROUP BY
    wk
ORDER BY
    game_count DESC

-- Which God was most likely to win? 
-- Which God had the most unique players? 
-- Which God had the highest number of games? 
-- Which God is likely to have the longest game? 
-- Generate an ordered list of the top 100 most successful users who have an above average level of activity and above average level of success. 
