-- Find the user who has rated the greatest number of movies
WITH UserRatings AS (
    SELECT mr.user_id, u.name, COUNT(mr.movie_id) AS rating_count
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY mr.user_id, u.name
)
SELECT name
FROM UserRatings
ORDER BY rating_count DESC, name ASC
LIMIT 1;

-- Find the movie with the highest average rating in February 2020
WITH MovieRatings AS (
    SELECT mr.movie_id, m.title, AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY mr.movie_id, m.title
)
SELECT title
FROM MovieRatings
ORDER BY avg_rating DESC, title ASC
LIMIT 1;
