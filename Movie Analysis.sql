--1) Top 5 movies by poipularity but has to have at least 1000 votes
Select top 5 Title,popularity
from movies
where vote_count>1000
order by popularity desc;

--2) what is the max and min years for the dataset
Select MAX(release_date) as newest_movie,MIN(release_date) as oldest_movie
from movies


--3) what are the movies that are higher than average rating
select title, vote_average
from movies
where vote_average >
 (Select AVG(vote_average)
 from movies);

 
 -- 4)Select max vote count and min count and their movie names
 
 Select title, vote_count,release_date
 from movies 
 where vote_count = (
 select MAX(vote_count)
 from movies)

  Select title, vote_count,release_date
 from movies 
 where vote_count = (
 select MIN(vote_count)
 from movies)

 -- 4)cluster the ratings into 3 different groups bad good and average
 Select Title, vote_average
 from movies

 Select min(vote_average)
 from movies

 Select max(vote_average)
 from movies

 select DIFFERENCE(max(vote_average),min(vote_average)) as difference_between_maxmin
 from movies

 Select title,vote_average,
 case
 when vote_average >= 5 and vote_average <6 then 'Bad'
 WHEN vote_average >= 6 and vote_average <7 then 'Average'
 WHEN vote_average >= 7 and vote_average <8 then 'great'
  WHEN vote_average >=8 then 'amazing' END as Ratings

 from movies



 -- 5)all the movies that were released after 2015 ordered by their vote counts desc while having
 -- higher than average rating
 Select title,release_date,vote_count
 from movies 
 where release_date > '2015'
 And vote_count > (
 select AVG(vote_count) from movies)
 order by vote_count desc

 -- 6)all movies that had higher than average vote counts while also having less than average ratings
 -- and what was the movie that had the least average rating with higher than average vote counts
 Select title,release_date,vote_average
 from movies 
 where vote_count > (select avg(vote_count) from movies)
 And vote_average = (select min(vote_average) from movies)
 order by vote_average asc
 -- movie that had least average ratings with higher than average votes was "Lara Croft: Tomb Raider - The Cradle of Life"


 --7) splitting date into years and viewing average ratings in each year where vote count is greater than average
 Select YEAR(release_date) as yearr, avg(vote_average) vote_average
 from movies
 group by YEAR(release_date)
 having sum(vote_count) > (Select avg(vote_count) from movies)
 order by avg(vote_average) desc
 -- highest vote average was in 1921

 --8) Number of Movies produced in each year ordered by movies count desc
 Select Year(release_date) as yearr,count(title) as movies_count
 from movies
 group by Year(release_date)
 order by count(title) desc
 -- most movies were made in year 2018

 -- 9)what years were people voting the most 
  Select Year(release_date) as yearr,sum(vote_count) as Vote_count
 from movies
 group by Year(release_date)
 order by sum(vote_count) desc
 -- people were voting the most in 2016

 
 







 