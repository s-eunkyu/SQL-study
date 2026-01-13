-- 2. array_exercises 테이블에서 각 영화(title)별로 배우(actor)와 배역(character)을 보여주세요. 배우와 배역은 별도의 컬럼으로 나와야 합니다
-- array_exercises: `movie_id`, `title`, `actors(actor, character)`, `genres`

SELECT
    title
  , act.actor
  , act.character
FROM `advanced.array_exercises`
CROSS JOIN UNNEST(actors) AS act;
