-- Tutorial
-- Show the name for the countries that have a population of at least 200 million.

SELECT name FROM world
WHERE population > 200000000

-- Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name, gdp/population
AS 'per capita GDP'
FROM world
WHERE population > 200000000

-- Show the name and population in millions for the countries of the continent 'South America'

SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

-- Show the name and population for France, Germany, Italy

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

-- Show the countries which have a name that includes the word 'United'

SELECT name
FROM world
WHERE name LIKE '%United%'

-- Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

-- Show the countries that are big by area or big by population but not both.

SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000

-- For South America show population in millions and GDP in billions both to 2 decimal places.

SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America'

-- Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000

-- Show the name and capital where the name and the capital have the same number of characters.

SELECT name, capital
FROM world
WHERE length(name) = length(capital)

-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.

SELECT name, capital
FROM world
WHERE capital LIKE concat(LEFT(name,1), '%')
AND name <> capital

-- Find the country that has all the vowels and no spaces in its name.

SELECT name
FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %'


-- Quiz
-- 1. Select the code which gives the name of countries beginning with U

SELECT name
FROM world
WHERE name LIKE 'U%'

-- 2. Select the code which shows just the population of United Kingdom?

SELECT population
FROM world
WHERE name = 'United Kingdom'

-- 3. Select the answer which shows the problem with this SQL code 

SELECT continent 
FROM world 
WHERE 'name' = 'France'
-- 'name' should be name

-- 4. Select the result that would be obtained from the following code:

SELECT name, population / 10 
FROM world 
WHERE population < 10000
-- Table 4

-- 5. Select the code which would reveal the name and population of countries in Europe and Asia

SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia')

-- 6. Select the code which would give two rows

SELECT name FROM world
WHERE name IN ('Cuba', 'Togo')

-- 7. Select the result that would be obtained from this code:

SELECT name FROM world
WHERE continent = 'South America'
AND population > 40000000
-- Table 3