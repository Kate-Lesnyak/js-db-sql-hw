-- movie_genre

-- 4	"Bad Boys: Ride or Die"
-- 5	"Deadpool & Wolverine"
-- 6	"Oppenheimer"
-- 7	"Avatar: The Way of Water"
-- 9	"Magnolia"

-- 1	"action"
-- 2	"drama"
-- 3	"comedy"
-- 4	"crime"
-- 6	"adventure"
-- 7	"marvel"
-- 5	"thriller"
-- 8	"biographical"
-- 9	"fantasy"

INSERT INTO movie_genre (movie_id, genre_id)
	VALUES
	(4, 1), (4, 3), (4, 4), (4, 5), (4, 6),
	(5, 1), (5, 3), (5, 7),
	(6, 2), (6, 5), (6, 8),
	(7, 1), (7, 6), (7, 9),
	(9, 2);
  
