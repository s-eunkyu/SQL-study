-- 1. array_exercises 테이블에서 각 영화(title)별로 장르(genres)를 UNNEST해서 보여주세요
-- array_exercises: `movie_id`, `title`, `actors(actor, character)`, `genres`

SELECT
    ae.title
  , genre
FROM `advanced.array_exercises` AS ae
CROSS JOIN UNNEST(genres) AS genre;
