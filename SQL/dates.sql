WITH game_summary AS
(
    SELECT
        DISTINCT game_start_ts::date dt
        ,TO_CHAR(game_start_ts::date, 'YYYY - "Week" WW') wk
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
        ,TO_CHAR(game_start_ts::date, 'YYYY - "Week" WW')
        ,user_id
        ,game_id
        ,player_god_name
        ,total_turn_qty
        ,game_time
        ,player_won_indc
        ,player_started_indc
)

-- Generate an ordered list of the top 100 most successful users who have an above average level of activity 
-- and above average level of success. 




-- Which God is likely to have the longest game? 
-- SELECT
--     player_god_name
--     ,AVG(total_turn_qty) avg_turn_count
--     ,AVG(game_time) avg_game_time
-- FROM
--     game_summary
-- GROUP BY
--     player_god_name
-- ORDER BY
--     avg_turn_count DESC
    
    

-- Which God had the highest number of games?
-- SELECT
--     player_god_name
--     ,COUNT(DISTINCT game_id) games
-- FROM game_summary
-- GROUP BY    
--     player_god_name
-- ORDER BY
--     games DESC


-- Which God had the most unique players? 
-- SELECT 
--     player_god_name
--     ,COUNT(DISTINCT user_id) players
-- FROM game_summary
-- GROUP BY
--     player_god_name
-- ORDER BY
--     players DESC


-- Which God was most likely to win? 
-- SELECT
--     player_god_name
--     ,MAX(CASE WHEN player_won_indc = true THEN game_count ELSE NULL END) games_won
--     ,MAX(CASE WHEN player_won_indc = false THEN game_count ELSE NULL END) games_lost
--     ,ROUND(MAX(CASE WHEN player_won_indc = true THEN game_count ELSE NULL END)/SUM(game_count),4) win_percent
-- FROM
-- (
--     SELECT
--         player_god_name
--         ,player_won_indc
--         ,COUNT(DISTINCT game_id) game_count
--     FROM game_summary
--     GROUP BY
--         player_god_name
--         ,player_won_indc
-- )a
-- GROUP BY
--     player_god_name
-- ORDER BY
--     win_percent DESC


-- Which week had the highest number of games?
-- SELECT
--     COUNT(DISTINCT game_id) game_count
--     ,wk
-- FROM
--     game_summary
-- GROUP BY
--     wk
-- ORDER BY
--     game_count DESC









