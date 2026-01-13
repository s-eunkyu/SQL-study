-- 3. array_exercises 테이블에서 각 영화(title) 별로 배우(actor), 배역(character), 장르(genre)를 출력하세요. 한 Row에 배우, 배역, 장르가 모두 표시되어야 합니다
-- array_exercises: `movie_id`, `title`, `actors(actor, character)`, `genres`

SELECT
    ae.title
  , act.actor
  , act.character
  , genre
FROM `advanced.array_exercises` AS ae
CROSS JOIN UNNEST(actors) AS act
CROSS JOIN UNNEST(genres) AS genre;
