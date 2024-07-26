CREATE TABLE user_favorite_movie (
    user_id INT REFERENCES user(id),
    movie_id INT REFERENCES movie(id),
    PRIMARY KEY (user_id, movie_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- movie_genre
4	"Bad Boys: Ride or Die"
5	"Deadpool & Wolverine"
6	"Oppenheimer"
7	"Avatar: The Way of Water"
9	"Magnolia"

1	"Cat_16"	"Kate"
2	"Cat_17"	"Olga"
3	"Cat_18"	"Oleg"
4	"Cat_19"	"Nadya"
5	"Cat_20"	"Vova"

INSERT INTO user_favorite_movie (user_id, movie_id)
	VALUES
	(1, 4), (1, 6), (1, 7),
	(2, 4), (2, 7), (2, 9),
	(3, 4), (3, 5), (3, 7),
	(4, 9), (4, 6),
	(5, 9);
  
